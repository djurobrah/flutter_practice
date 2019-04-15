import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> _products = ['bla'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App Title"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              child: RaisedButton(
                child: Text("Press me!"),
                onPressed: () {
                  setState(() {
                    _products.add("blabla");
                  });
                },
              ),
            ),
            Column(
              children: _products
                  .map((element) => Card(
                        color: Colors.amberAccent,
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/image.jpg"),
                            Text(element),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
