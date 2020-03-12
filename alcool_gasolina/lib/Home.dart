import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool=TextEditingController();
  TextEditingController _controllerGasolina=TextEditingController();
  var _msgResultado="";

  void _limparCampo(){
    _controllerAlcool.text="";
    _controllerGasolina.text="";
  }

  void _calcular() {
    double precoAlcool= double.tryParse(_controllerAlcool.text);
    double precoGasolina= double.tryParse(_controllerGasolina.text);

    setState(() {
      if(precoAlcool==null  || precoGasolina== null){
        _msgResultado="Existem campos não preenchido corretamente";
      }else if(precoAlcool<precoGasolina*0.7){
        _msgResultado="Escolha o alcool";
      }else{
        _msgResultado="Escolha a gasolina";
      }
    });
    _limparCampo();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("imagens/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Saiba qual a melhor opção de abastecimento para o seu carro",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Alcool, ex 3.59"
                ),
                style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex 4.99"
                ),
                style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Calcular"),
                  onPressed: (){
                    _calcular();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(_msgResultado,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          )
          )
      ),
    );
  }
}
