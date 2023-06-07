import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:spotify_player/models/category.dart';
import 'package:spotify_player/services/category_operations.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFc0392b), Color(0xFF8e44ad)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            TopAppBar("Good Morning"),
            SizedBox(height: 10.0),
            CreateGrid(),
          ],
        ),
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
      width: 350,
      height: 350,
      borderRadius: 20,
      blur: 20,
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

/*
*/
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
