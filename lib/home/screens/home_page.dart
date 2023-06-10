import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_p/home/bloc/home_bloc.dart';
import 'package:orange_p/home/screens/category_page.dart';
import 'package:orange_p/home/widgets/account_info.dart';
import 'package:orange_p/home/widgets/bottom_nav_bar.dart';
import 'package:orange_p/home/widgets/bottom_sheet_header_title.dart';
import 'package:orange_p/home/widgets/date.dart';
import 'package:orange_p/home/widgets/emoticon_card.dart';
import 'package:orange_p/home/widgets/exercise_tile.dart';
import 'package:orange_p/home/widgets/greet.dart';
import 'package:orange_p/home/widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == HomeStatus.loaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Mood Changed to ${state.mood}',
                style: const TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavBar(
            currentIndex: state.index,
          ),
          body: state.index == 0 ? const _HomeBody() : const CategoryPage(),
        );
      },
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Text(
              state.mood,
              style: const TextStyle(fontSize: 35),
            );
          },
        ),
      ),
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AccountInfo(dinheiroPsd: "1234,54"),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      EmoticonCard(
                        mood: 'Badly',
                        icon: Icon(Icons.abc_sharp),
                      ),
                      EmoticonCard(
                        mood: 'Badly',
                        icon: Icon(Icons.abc_sharp),
                      ),
                      EmoticonCard(
                        mood: 'Badly',
                        icon: Icon(Icons.abc_sharp),
                      ),
                      EmoticonCard(
                        mood: 'Badly',
                        icon: Icon(Icons.abc_sharp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
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
                      const BottomSheetHeaderTitle(
                        titleText: 'Exercises',
                      ),
                      Expanded(
                        child: ListView(
                          //how to use ListView.builder in this?
                          children: const [
                            ExerciseTile(
                              exercise: 'Speaking Skills',
                              subExercise: '16 Exercises',
                              icon: Icons.favorite,
                              color: Colors.orange,
                            ),
                            ExerciseTile(
                              exercise: 'Reading Speed',
                              subExercise: '8 Exercises',
                              icon: Icons.person,
                              color: Colors.pink,
                            ),
                            ExerciseTile(
                              exercise: 'Speaking Skills',
                              subExercise: '16 Exercises',
                              icon: Icons.umbrella,
                              color: Colors.red,
                            ),
                            ExerciseTile(
                              exercise: 'Speaking Skills',
                              subExercise: '16 Exercises',
                              icon: Icons.book,
                              color: Colors.yellow,
                            ),
                            ExerciseTile(
                              exercise: 'Speaking Skills',
                              subExercise: '16 Exercises',
                              icon: Icons.music_note,
                              color: Colors.pink,
                            ),
                            ExerciseTile(
                              exercise: 'Speaking Skills',
                              subExercise: '16 Exercises',
                              icon: Icons.mobile_friendly,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
