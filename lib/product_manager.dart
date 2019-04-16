import 'package:flutter/material.dart';

import 'package:flutter_practice/products.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  ProductManager({this.startingProduct = 'Default argument'});

  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];
  
  @override
  void initState() { //executed before the widget is built
    _products.add(widget.startingProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
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
