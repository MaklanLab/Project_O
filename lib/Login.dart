import 'dart:ffi';

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
            width: double.infinity,
            child: Text(
              "Bem vindo !",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 60,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextField(
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
            ),
          ),
          Container(
            height: 60,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextField(
              style: TextStyle(fontSize: 14),
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Entrar'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  width: 2,
                  color: Colors.green,
                ),
              ),
              primary: Colors.green,
            ),
          ),
          Expanded(
            child: SizedBox(height: 1),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Esqueceu sua senha?",
              style: TextStyle(color: Color.fromARGB(255, 70, 155, 72)),
            ),
          )
        ],
      )),
    );
  }
}
