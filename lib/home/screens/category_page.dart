import 'package:flutter/material.dart';
import 'package:orange_p/home/widgets/bottom_sheet_header_title.dart';
import 'package:orange_p/home/widgets/category_grid.dart';
import 'package:orange_p/home/widgets/date.dart';
import 'package:orange_p/home/widgets/exercise_tile.dart';
import 'package:orange_p/home/widgets/greet.dart';
import 'package:orange_p/home/widgets/search_field.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const BottomNavBar(
      //   currentIndex: 1,
      // ),
      backgroundColor: Colors.blue[800],
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Greet(),
                Date(),
                SizedBox(
                  height: 25.0,
                ),
                SizedBox(
                  height: 25.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blueAccent,
                    blurRadius: 10,
                    //offset: Offset.infinite,
                  ),
                ],
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(
                    35.0,
                  ),
                  topRight: Radius.circular(
                    35.0,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        //crossAxisSpacing: 10,
                        //mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: [],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: ListView(
                        //how to use ListView.builder in this?
                        children: const [],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
