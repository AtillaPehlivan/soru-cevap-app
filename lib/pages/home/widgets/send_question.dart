

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SendQuestionView extends StatefulWidget {
  final String image;

  const SendQuestionView({Key key, @required this.image}) : super(key: key);

  @override
  _SendQuestionViewState createState() => _SendQuestionViewState();
}

class _SendQuestionViewState extends State<SendQuestionView> {




  ProgressDialog _progressDialog;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  sendQuestion(BuildContext context) async {
    _progressDialog =  ProgressDialog(context, isDismissible: false,type: ProgressDialogType.Normal);
    _progressDialog.style(message: "Sorunuz Gönderiliyor..",progressWidget: CircularProgressIndicator());
    _progressDialog.show();
    await Future.delayed(Duration(milliseconds: 500));
    _progressDialog.update(message: "Resim Yükleniyor..");
    await this.uploadFile();
    _progressDialog.update(message: "Tamamlandı",progressWidget: Icon(Icons.check_circle,color: Theme.of(context).primaryColor,));
    await Future.delayed(Duration(milliseconds: 500));
    _progressDialog.hide();

    Navigator.pop(context);

  }

  Future uploadFile() async {
    String now = DateTime.now().toString();
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('user-upload/'+now);
    StorageUploadTask uploadTask = storageReference.putFile(File(widget.image));
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      print(fileURL);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          tooltip: "Gönder",
          onPressed: () async => {await sendQuestion(context)},
          child: Icon(
            Icons.send,
            color: Colors.white,
          )),
      appBar: AppBar(
        title: Text("Soru Sor!"),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(
              Icons.help,
              color: Colors.white,
            ),
            itemBuilder: (BuildContext context) {
              return [PopupMenuItem(child: Text("Yardım")), PopupMenuItem(child: Text("Sorun Var"))];
            },
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Center(
                  child: Text(
                "Sorunuza ait resim",
                style: TextStyle(fontSize: 20),
              )),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                      decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColor, width: 5)),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Image(
                        image: Image.file(File(widget.image)).image,
                        fit: BoxFit.contain,
                      )),
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                style: TextStyle(fontSize: 20),
                maxLines: 2,
                textAlign: TextAlign.center,
                decoration: InputDecoration.collapsed(hintText: "Mesajınız...", border: OutlineInputBorder()),
              )
            ],
          ),
        ),
      )),
    );
  }
}
