import 'package:flutter/material.dart';
import 'package:spotify_player/screens/search.dart';
import 'package:spotify_player/screens/yourlibrary.dart';

import 'home.dart';

class MyAoo extends StatefulWidget {
  const MyAoo({Key? key}) : super(key: key);

  @override
  State<MyAoo> createState() => _MyAooState();
}

class _MyAooState extends State<MyAoo> {
  final Tabs = [home(), search(), yourlibrary()];
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[currentTabIndex],
      backgroundColor: Colors.blueGrey[900],
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}
