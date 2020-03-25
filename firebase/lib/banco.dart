import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal List';
    Firestore db = Firestore.instance;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 80.0,
      child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
        Container(
            width: 160.0,
            child: RaisedButton(
                onPressed: () {
                  db
                      .collection("usuarios")
                      .document("001")
                      .setData({"nome": "Wagner Luiz", "idade": "33"});
                },
                color: Colors.red,
                child: Text('Insert w/ ID', style: TextStyle(fontSize: 20)))),
        Container(
            width: 160.0,
            child: RaisedButton(
                onPressed: () {
                  db.collection("usuarios").document("001").delete();
                },
                color: Colors.orange,
                child: Text('Remove', style: TextStyle(fontSize: 20)))),
        Container(
            width: 160.0,
            child: RaisedButton(
                onPressed: () async => await inserirNoticiaSemID(db),
                color: Colors.blue,
                child:
                    Text('Insert new any ID', style: TextStyle(fontSize: 20)))),
        Container(
            width: 160.0,
            child: RaisedButton(
                onPressed: () => updateNoticias(db),
                color: Colors.orange,
                child: Text('Update news', style: TextStyle(fontSize: 20)))),
        Container(
            width: 160.0,
            child: RaisedButton(
                onPressed: () => recuperaUsuarioPorID(db, "001"),
                color: Colors.pink,
                child: Text('Get by iD', style: TextStyle(fontSize: 20)))),
        Container(
            width: 160.0,
            child: RaisedButton(
                onPressed: () => recuperaTodasNoticias(db),
                color: Colors.green,
                child: Text('Get all news', style: TextStyle(fontSize: 20)))),
        Container(
            width: 160.0,
            child: RaisedButton(
                onPressed: () => recuperaDadosListener(db),
                color: Colors.grey,
                child: Text('Get news with listener', style: TextStyle(fontSize: 20)))),
        Container(
            width: 160.0,
            child: RaisedButton(
                onPressed: () => recuperaPorFiltro(db),
                color: Colors.redAccent,
                child: Text('Find with filter', style: TextStyle(fontSize: 20)))),

      ]),
    );
  }

  Future inserirNoticiaSemID(Firestore db) async {
    var data = {
      "titulo": "Aumento nos casos de coronavirus",
      "descricao": "texto de exemplo"
    };
    DocumentReference ref = await db.collection("noticias").add(data);
    print("item salvo " + ref.documentID);
  }

  void updateNoticias(Firestore db) {
    db.collection("noticias").document("YbRWdNsJC02GywTHZrYa").setData(
        {"titulo": "Italia esta em crise", "descricao": "texto de exemplo"});
  }

  Future recuperaUsuarioPorID(Firestore db, id) async {
    DocumentSnapshot snapshot =
        await db.collection("usuarios").document(id).get();
    print(snapshot.documentID);
    print(snapshot.documentID + " " + snapshot.data.toString());
    print(snapshot.data['nome']);
  }

  Future recuperaTodasNoticias(Firestore db) async {
    QuerySnapshot querySnapshot =
        await db.collection("noticias").getDocuments();

    for (DocumentSnapshot item in querySnapshot.documents) {
      print(item.documentID + " noticia " + item.data.toString());
    }
    return 0;
  }

  void recuperaDadosListener(Firestore db) {
    db.collection("noticias").snapshots().listen((snapshop) {
      for (DocumentSnapshot item in snapshop.documents) {
        print(item.documentID + " noticia " + item.data.toString());
      }
    });
  }

  Future<void> recuperaPorFiltro(Firestore db) async {
    QuerySnapshot querySnapshot = await db.collection("usuarios")
        .where("idade", isGreaterThan: 18)
        .where("idade", isLessThanOrEqualTo: 40)
        .orderBy("idade", descending: false)
        .getDocuments();
    for (DocumentSnapshot item in querySnapshot.documents) {
      print(item.documentID + " usuario " + item.data.toString());
    }
  }
}
