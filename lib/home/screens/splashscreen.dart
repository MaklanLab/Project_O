import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:orange_p/home/screens/login.dart';
import 'package:orange_p/home/screens/register.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 229, 1, 1.0),
              Color.fromRGBO(255, 229, 1, 1.0),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              SizedBox(
                height: 40,
              ),
              Lottie.asset(
                'assets/guru-animation.json', // Substitua pelo caminho do seu arquivo Lottie
                width: 330,
                height: 330,
              ),
              Expanded(child: Container()),
              Text(
                'Valorize seu dinheiro',
                style: const TextStyle(
                  fontFamily: 'Config Rounded',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
                key: UniqueKey(),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Economize melhor, viva melhor! Descubra nosso app e transforme suas finanças. Seu futuro financeiro começa agora",
                  style: const TextStyle(
                    fontFamily: 'Config Rounded', // Fonte arredondada
                    fontSize: 12,
                    color: Color.fromARGB(225, 14, 14, 14),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  key: UniqueKey(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 40,
                    margin: const EdgeInsets.only(right: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(
                            255, 229, 1, 1.0), // Cor de fundo transparente
                        side: const BorderSide(
                          color: Colors.black, // Cor da borda preta
                          width: 1.0, // Espessura da borda
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Roboto', // Fonte padrão para os botões
                          color: Colors.black, // Cor do texto preto
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 140,
                    height: 40,
                    margin: const EdgeInsets.only(left: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black, // Cor de fundo preta
                      ),
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(
                          fontFamily: 'Roboto', // Fonte padrão para os botões
                          color: Colors.white, // Cor do texto branco
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
