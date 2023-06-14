import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify_player/models/music.dart';
import 'package:spotify_player/screens/search.dart';
import 'package:spotify_player/screens/yourlibrary.dart';

import 'home.dart';

class MyAoo extends StatefulWidget {
  const MyAoo({Key? key}) : super(key: key);

  @override
  State<MyAoo> createState() => _MyAooState();
}

class _MyAooState extends State<MyAoo> {
  var Tabs = [];
  int currentTabIndex = 0;
  bool isPlaying = false;
  Music? music;

  //Connecting the audio player with the dependency of the player with the miniplayer
  AudioPlayer _audioPlayer = new AudioPlayer();
  Widget miniPlayer(Music? music, {bool stop = false}) {
    // here bool is an optionl argument which will stop the previous playing song and play a new song
    this.music = music;

    if (music == null) {
      return SizedBox();
    }
    if (stop) {
      _audioPlayer.stop();
      isPlaying = false;
    }
    setState(() {});
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 5000),
      color: Colors.blueGrey,
      width: deviceSize.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            music.image,
            fit: BoxFit.cover,
          ),
          Text(
            music.name,
            style: const TextStyle(color: Colors.white),
          ),
          IconButton(
            onPressed: () async {
              isPlaying = !isPlaying;
              if (isPlaying) {
                await _audioPlayer.play(UrlSource(music.audioURL));
              } else {
                await _audioPlayer.pause();
              }
              setState(() {});
            },
            color: Colors.white,
            icon: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Tabs = [home(miniPlayer), search(), yourlibrary()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Tabs[currentTabIndex],
        backgroundColor: Colors.blueGrey[900],
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            miniPlayer(music),
            BottomNavigationBar(
              backgroundColor: Colors.grey[900],
              // selectedLabelStyle: const TextStyle(color: Colors.white),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white38,
              currentIndex: currentTabIndex,
              onTap: (currentIndex) {
                setState(() {
                  currentTabIndex = currentIndex;
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    label: "HOME"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.library_add,
                      color: Colors.white,
                    ),
                    label: "Library")
              ],
            ),
          ],
        ));
  }
}
