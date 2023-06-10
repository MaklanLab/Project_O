import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:orange_p/home/auxiliadoras/auth.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 38,
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: ElevatedButton(
        child: Text(
          "Entrar",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          print("sdd");
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1565C0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
