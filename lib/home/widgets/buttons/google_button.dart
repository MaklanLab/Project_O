import 'package:flutter/material.dart';

class Google_login extends StatelessWidget {
  const Google_login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: ElevatedButton(
          onPressed: () {
            // Lógica de autenticação do Google aqui
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.white, // Cor de fundo do botão
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(50), // Raio dos cantos do botão
              side: BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0)), // Borda do botão
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/google_logo.png', // Caminho da imagem do logotipo do Google
                height: 24, // Altura desejada da imagem
              ),
              SizedBox(width: 10), // Espaçamento entre o logotipo e o texto
              Text(
                'Entre com Google',
                style: TextStyle(fontSize: 16, color: Colors.blueGrey),
              ),
            ],
          ),
        ));
  }
}
