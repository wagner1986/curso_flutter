import 'package:flutter/material.dart';
import 'package:navegacao/TelaSecundaria.dart';

void main(){
  runApp(MaterialApp(
    home: TelaPrincipal(),
  ));
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("Tela principal"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text("Ir para segunda tela"),
                padding: EdgeInsets.all(12),
                onPressed: (){
                  print("mudar a tela");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=>TelaSecundaria()
                      )
                  );
                })
          ],
        ),
      ),
    );
  }
}
