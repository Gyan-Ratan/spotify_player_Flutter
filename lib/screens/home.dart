import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:spotify_player/models/category.dart';
import 'package:spotify_player/models/music.dart';
import 'package:spotify_player/services/category_operations.dart';
import 'package:spotify_player/services/music_operations.dart';

class home extends StatelessWidget {
  // const home({Key? key}) : super(key: key);
  //Here we are sharing the data between the two widghets the app.dart and home.dart
  //now this is done to implement the functionaly to implement the feature which will allow to play the music when the
  // Image container will be tapped
  // On tab play music
  Function _miniPlayer;
  home(this._miniPlayer); // short hand for the constructor
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00000), Color(0xFF00000), Color(0xFF7F53AC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              TopAppBar("Good Morning"),
              SizedBox(height: 10.0),
              CreateGrid(),
              createMusicList("Music For You"),
              createMusicList("Popular Playlist"),
            ],
          ),
        ),
      ),
    );
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 150,
            child: InkWell(
              onTap: () {
                _miniPlayer(music);
              },
              child: Image.network(
                music.image,
                fit: BoxFit.cover,
                height: 160,
              ),
            ),
          ),
          Text(
            music.name,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            music.description,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<Music> musicList = MusicOperations.getMusic();
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 230.0,
            child: ListView.builder(
              padding: EdgeInsets.all(5.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget TopAppBar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(message),
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Icon(Icons.settings),
        )
      ],
    );
  }

  Widget createCategory(Category category) {
    return GlassmorphicContainer(
      width: 10,
      height: 10,
      borderRadius: 20,
      blur: 100,
      alignment: Alignment.bottomCenter,
      border: 1,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFffffff).withOpacity(0.1),
            Color(0xFFFFFFFF).withOpacity(0.05),
          ],
          stops: [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFc0392b).withOpacity(0.5),
          Color((0xFF8e44ad)).withOpacity(0.5),
        ],
      ),
      child: Row(
        children: [
          Image.network(
            category.imageURL,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              category.name,
              style: TextStyle(color: Colors.white38),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> createListOfCategories() {
    List<Category> categoryList =
        CategoryOperations.getCategories(); // Recieve Data
    // Convert Data to WIdget using Map Fucnction
    List<Widget> categories = categoryList
        .map((Category category) => createCategory(category))
        .toList();
    return categories;
  }

  Widget CreateGrid() {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 200.0,
      child: GridView.count(
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        crossAxisCount: 2,
        children: createListOfCategories(),
      ),
    );
  }
}
