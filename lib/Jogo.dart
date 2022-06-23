import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imageApp = const AssetImage("images/padrao.png");
  var _message = "Escolha uma opção abaixo:";
  void _choice(String choice) {
    var options = ["pedra", "papel", "tesoura"];
    var number = Random().nextInt(options.length);
    var appchoice = options[number];
    switch (appchoice) {
      case "pedra":
        setState(() {
          _imageApp = const AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imageApp = const AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imageApp = const AssetImage("images/tesoura.png");
        });
        break;
    }
    if ((choice == "pedra" && appchoice == "tesoura") ||
        (choice == "tesoura" && appchoice == "papel") ||
        (choice == "papel" && appchoice == "pedra")) {
          setState(() {
            _message = "Parabéns, Você Ganhou!";
          });
    } else if ((choice == "tesoura" && appchoice == "pedra") ||
        (choice == "papel" && appchoice == "tesoura") ||
        (choice == "pedra" && appchoice == "papel")) {
          setState(() {
            _message = "Você Perdeu :(!";
          });
        }
      else{
        setState(() {
            _message = "Empate!";
          });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Jokenpo")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: _imageApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _message,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _choice("pedra"),
                child: Image.asset("images/pedra.png", height: 95),
              ),
              GestureDetector(
                onTap: () => _choice("papel"),
                child: Image.asset("images/papel.png", height: 95),
              ),
              GestureDetector(
                onTap: () => _choice("tesoura"),
                child: Image.asset("images/tesoura.png", height: 95),
              ),
            ],
          )
        ],
      ),
    );
  }
}
