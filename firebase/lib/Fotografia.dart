import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Fotografia extends StatefulWidget {
  @override
  _FotografiaState createState() => _FotografiaState();
}

class _FotografiaState extends State<Fotografia> {
  File _imagem;
  String _statusUpload = "Não inicializado";

  String _urlImagemRecuperada;

  Future _recuperaImagem(bool daCamera) async {
    File imagemSelecionada;
    if (daCamera) {
      imagemSelecionada =
          await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      imagemSelecionada =
          await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _imagem = imagemSelecionada;
    });
  }

  Future _uploadImagem() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference pastaRaiz = storage.ref();

    StorageReference arquivo = pastaRaiz.child("fotos").child("fotos1.jpg");

    //fazer upload
    StorageUploadTask task = arquivo.putFile(_imagem);
    //controlar progresso do upload
    task.events.listen((StorageTaskEvent storageEvents) {
      if (storageEvents.type == StorageTaskEventType.progress) {
        setState(() {
          _statusUpload = "Em progresso";
        });
      } else if (storageEvents.type == StorageTaskEventType.success) {
        setState(() {
          _statusUpload = "Realizado com sucesso";
        });
      }
    });

    //recuperar url da imagem
    task.onComplete.then((StorageTaskSnapshot snapshot) {
      _recuperaUrlImagem(snapshot);
    });
  }

  Future _recuperaUrlImagem(StorageTaskSnapshot snapshot) async {
    String url = await snapshot.ref.getDownloadURL();
    print("resultado url " + url);
    setState(() {
      _urlImagemRecuperada = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecionar uma imagem'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(_statusUpload),
            RaisedButton(
              onPressed: () {
                _recuperaImagem(true);
              },
              child: Text("Camera"),
            ),
            RaisedButton(
              onPressed: () {
                _recuperaImagem(false);
              },
              child: Text("Galeria"),
            ),
            _imagem == null
                ? Container()
                : Image.file(
                    _imagem,
                    height: 200,
                  ),
            _imagem == null
                ? Container()
                : RaisedButton(
                    onPressed: () {
                      _uploadImagem();
                    },
                    child: Text("Upload"),
                  ),
            Text("Imagem da url do Firebase "),
            _urlImagemRecuperada == null
                ? Container()
                : Image.network(
                    _urlImagemRecuperada,
                    height: 200,
                  )
          ],
        ),
      ),
    );
  }
}
