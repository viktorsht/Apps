import 'package:flutter/material.dart';
import 'dart:math';


class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("img/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario){
    var opcoes = ["pedra", "papel","tesoura"];
    var i = -1;
    var numero = Random().nextInt(3);
    while(numero == i){
      numero = Random().nextInt(3);
    }
    var escolhaApp = opcoes[numero];
    i = numero;

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("img/pedra.png");
        });
        break;
      case "papel":
        setState(() {
            this._imagemApp = AssetImage("img/papel.png");
          });
        break;
      case "tesoura":
        setState(() {
            this._imagemApp = AssetImage("img/tesoura.png");
          });
        break;
    }
    // validar ganhador
    if(
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel")
    ){
      setState(() {
        this._mensagem = "Você ganhou !!";
      });
    }
    else if(
      (escolhaUsuario == "pedra" && escolhaApp == "papel") ||
      (escolhaUsuario == "papel" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "pedra")
    )
    {
      setState(() {
        this._mensagem = "Você perdeu !!";
      });
    }
    else{
      setState(() {
        this._mensagem = "Empatamos !!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joken Po"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //text
          // imagem
          //text result
          //linha 3 imgs
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16), 
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          //Image.asset("img/padrao.png",height: 80),
          Image(image: this._imagemApp, height: 80),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16), 
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("img/pedra.png",height: 50),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("img/papel.png",height: 50),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("img/tesoura.png",height: 50),
              )
              /*
              Image.asset("img/pedra.png",height: 50),
              Image.asset("img/papel.png",height: 50),
              Image.asset("img/tesoura.png",height: 50),
              */
            ],
          )
        ],
      ),
    );
  }
}