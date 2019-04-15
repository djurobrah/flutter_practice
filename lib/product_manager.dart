import 'package:flutter/material.dart';

import 'package:flutter_practice/products.dart';

class ProductManager extends StatefulWidget {
  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = ['bla'];

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Products(_products),
      ],
    );
  }
}
