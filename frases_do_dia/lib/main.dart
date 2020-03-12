import 'dart:math';
import  'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases=[
    "O grande homem é aquele que não perdeu a candura de sua infância.",
    "Quem abre o coração à ambição, fecha-o à tranquilidade.",
    "A persistência realiza o impossível.",
    "Um erro da largura de um fio de cabelo pode causar um desvio de mil quilômetros.",
    "Espere com paciência, ataque com rapidez.",
  ];
  var _fraseGerada="Clique abaixo para gerar uma frase!";

  void _gerarFrase(){
    var numSorteado=Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada=_frases[numSorteado];
    });
    print(_fraseGerada);
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
          padding: EdgeInsets.all(16),
          /*decoration: BoxDecoration(
              border: Border.all(width: 3,color: Colors.white)
          ),*/
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/logo.png",),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              RaisedButton(
                onPressed: _gerarFrase,
                child: Text(
                  "Nova Frase",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}
