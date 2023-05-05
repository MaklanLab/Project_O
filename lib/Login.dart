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
          appBar: AppBar(
            title: const Text('Araspend'),
            backgroundColor: Color.fromARGB(255, 246, 155, 50),
          ),
          body: Column(
            children: [
              Expanded(
                child: SizedBox(height: 1),
              ),
              Center(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 200,
                      child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height: 40,
                                  child: TextField(
                                    style: TextStyle(fontSize: 12),
                                    decoration: InputDecoration(
                                      labelText: 'E-mail',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 40,
                                  child: TextField(
                                    style: TextStyle(fontSize: 12),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: 'Senha',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Entrar'),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        width: 2,
                                        color: Colors.green,
                                      ),
                                    ),
                                    primary: Color.fromARGB(255, 246, 155, 50),
                                  ),
                                ),
                              ],
                            ),
                          )))),
              Expanded(
                child: SizedBox(height: 1),
              ),
            ],
          )),
    );
  }
}
