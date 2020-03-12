import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  @override
  _TelaClienteState createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Cliente"),
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
                    Image.asset("images/detalhe_cliente.png"),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Cliente",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.lightGreen
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Image.asset("images/cliente1.png"),
                ),
                Text("Empresa de software"),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Image.asset("images/cliente2.png"),
                ),
                Text("Empresa de auditoria"),
              ],
            ),
          ),
        )
    );
  }
}
