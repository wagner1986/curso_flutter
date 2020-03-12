import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  @override
  _TelaContatoState createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Contato"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset("images/detalhe_contato.png"),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Contato",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.orange
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("email : consultoria@atm.com.br"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("telefone :(21) 4444-2313"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("celular :(21) 9444-2313"),
                )


              ],
            ),
          ),
        )
    );
  }
}
