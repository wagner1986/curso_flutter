import 'package:flutter/material.dart';

class TelaServico extends StatefulWidget {
  @override
  _TelaServicoState createState() => _TelaServicoState();
}

class _TelaServicoState extends State<TelaServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Servico"),
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
                    Image.asset("images/detalhe_servico.png"),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Nossos servicos",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.cyan
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("Consultoria"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("Calculo de preço"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("Acompanhamento de projetos"),
                )

              ],
            ),
          ),
        )
    );
  }
}