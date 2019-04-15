import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App Title"),
        ),
        body: Card(
          child: Column(
            children: <Widget>[
              Image.asset("assets/image.jpg"),
              Text("Card text."),
            ],
          ),
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}
