import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal List';
    FirebaseAuth auth = FirebaseAuth.instance;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 80.0,
      child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
        Container(
            width: 160.0,
            child: RaisedButton(
                onPressed: () =>
                    signIn(auth, "rengaw.luiz@gmail.com", "12345"),
                color: Colors.red,
                child: Text('Login', style: TextStyle(fontSize: 20)))),
        Container(
            width: 160.0,
            child: RaisedButton(
                onPressed: () => isLogin(auth),
                color: Colors.blue,
                child: Text('Check user', style: TextStyle(fontSize: 20)))),
        Container(
            width: 160.0,
            child: RaisedButton(
                onPressed: () =>
                    createUser(auth, "wagner32@gmail.com", "123456"),
                color: Colors.orange,
                child: Text('Create User', style: TextStyle(fontSize: 20)))),
        Container(
          width: 160.0,
          child: RaisedButton(
              onPressed:(){
                
              },
              color: Colors.orange,
              child: Text('Create User', style: TextStyle(fontSize: 20)))),
      ]),
    );
  }

  void signIn(FirebaseAuth auth, String email, String senha) {
    auth
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((firebaseuser) {
      print("Login realizado : " + firebaseuser.email);
    }).catchError((erro) {
      print("Erro durante o login : " + erro);
    });
  }

  void isLogin(FirebaseAuth auth) {
    auth.currentUser().then((firebaseuser) {
      print("usuario logado " +
          firebaseuser.email +
          " email verificado " +
          firebaseuser.isEmailVerified.toString());
    });
  }

  void createUser(FirebaseAuth auth, String email, String senha) {
    auth
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((firebaseuser) {
      print("Novo usuário: " + firebaseuser.email);
    }).catchError((erro) {
      print("Erro ao criar usuário: " + erro);
    });
  }
}
