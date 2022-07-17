import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      //title:'Frases do Dia',
      //theme: ThemeData(primarySwatch: Colors.green),
      home:Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _frases = [
    "Não busque a felicidade fora, mas sim dentro de você, caso contrário nunca a encontrará.",
    "É impossível para um homem aprender aquilo que ele acha que já sabe.",
    "Primeiro aprenda o significado do que você diz, e então fale.",
    "Então a partir de agora, como um homem feito e que progride, considera a tua vida merecedora de valor.",
  ];

  var _novaFrase = "Clique para gerar uma frase!";

  void _gerarFrase(){
    var sorteado = Random().nextInt(_frases.length);
    setState(() {
      _novaFrase = _frases[sorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          //width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("img/icon.png"),
              Text(
                _novaFrase,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Colors.black
                ),
              ),
              RaisedButton(
                child: Text(
                  "Nova frase:",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
                color: Colors.green,
                onPressed: _gerarFrase,
              )
            ],
          ),
        ),
      ),
    );
  }
}
