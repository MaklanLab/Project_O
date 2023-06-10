import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_p/home/bloc/home_bloc.dart';

class EmoticonCard extends StatelessWidget {
  const EmoticonCard({super.key, required this.icon, required this.mood});

  final Icon icon;
  final String mood;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("!");
      },
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 17,
                right: 17,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                color: Colors.blue[600],
              ),
              child: icon),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            mood,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 19.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
