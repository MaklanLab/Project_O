import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_p/constants.dart';
import 'package:orange_p/home/bloc/home_bloc.dart';
import 'package:orange_p/home/widgets/notification_icon.dart';

class Greet extends StatelessWidget {
  const Greet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Text(
              'Olá, Jared! ${state.mood}',
              style: greetText,
            );
          },
        ),
        const NotificationIcon()
      ],
    );
  }
}
