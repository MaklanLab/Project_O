import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import '../widgets/buttons/google_button.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailControl = TextEditingController();
  final TextEditingController _passwordControl = TextEditingController();
  final TextEditingController _usernameControl = TextEditingController();
  final TextEditingController _celphoneControl = TextEditingController();
  final TextEditingController _passwordConfirmationControl =
      TextEditingController();

  String _email = '';
  String _password = '';
  String? completeMessage;

  Future<void> _registerUser() async {
    final String email = _emailControl.text;
    final String password = _passwordControl.text;
    final String passwordConfirm = _passwordConfirmationControl.text;
    final String userName = _usernameControl.text;
    final String celPhone = _celphoneControl.text;

    try {
      final Uri registerUrl = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAAf46cXts_XvNtU-5ch6kA1P6p2cC_v5c');
      final Map<String, dynamic> requestData = {
        'email': email,
        'password': password,
        'returnSecureToken': true,
      };

      final response =
          await http.post(registerUrl, body: json.encode(requestData));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final String userId = responseData['localId'];

        final Uri databaseUrl = Uri.parse(
            'https://project-orange8-default-rtdb.firebaseio.com/Users/$userId.json');
        final Map<String, dynamic> userData = {
          'nome': userName,
          'email': email,
          'celPhone': celPhone,
          'data_registro': DateTime.now().toString(),
        };

        final databaseResponse =
            await http.post(databaseUrl, body: json.encode(userData));

        if (databaseResponse.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Usuário registrado com sucesso!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Erro ao salvar os dados do usuário no banco de dados.',
              ),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Erro ao registrar o usuário. Status do erro: ${response.statusCode}',
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao registrar o usuário: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 160,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 10,
                    top: 20,
                    child: Container(
                      child: Lottie.asset(
                        'assets/girl.json', // Substitua pelo caminho do seu arquivo Lottie
                        width: 160,
                        height: 160,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Bem vindo",
                style: const TextStyle(
                  fontFamily: 'Config Rounded', // Fonte arredondada
                  fontSize: 30,
                  color: Color.fromARGB(225, 14, 14, 14),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                key: UniqueKey(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(249, 245, 245, 245),
                              ),
                            ),
                          ),
                          child: TextField(
                            controller: _usernameControl,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Username",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(249, 245, 245, 245),
                              ),
                            ),
                          ),
                          child: TextField(
                            controller: _celphoneControl,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Telefone",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(253, 245, 245, 245),
                              ),
                            ),
                          ),
                          child: TextField(
                            controller: _emailControl,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(253, 245, 245, 245),
                              ),
                            ),
                          ),
                          child: TextField(
                            controller: _passwordControl,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(253, 245, 245, 245),
                              ),
                            ),
                          ),
                          child: TextField(
                            controller: _passwordConfirmationControl,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  const Center(
                    child: Text(
                      "Esqueceu a senha?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromRGBO(255, 229, 1, 1.0),
                    ),
                    child: TextButton(
                      onPressed: _registerUser,
                      child: const Text(
                        "Entrar",
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: Divider(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('ou continue com'),
                      ),
                      Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Google_login(),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
