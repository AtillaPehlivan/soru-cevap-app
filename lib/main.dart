import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Title"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.ac_unit), onPressed: () => {print("atilla")})
          ],
        ),
      ),
    );
  }
}
