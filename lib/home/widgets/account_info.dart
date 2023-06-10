import 'package:flutter/material.dart';
import 'package:orange_p/constants.dart';

class AccountInfo extends StatelessWidget {
  final String dinheiroPsd;
  const AccountInfo({super.key, required this.dinheiroPsd});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('R\$ $dinheiroPsd', style: greetText));
  }
}
