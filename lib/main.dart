import 'package:flutter/material.dart';

main() {
  runApp(RootWidget());
}

class RootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App Title"),
        ),
      ),
    );
  }
}
