import 'package:flutter/material.dart';

import 'package:flutter_practice/products.dart';
import 'product_control.dart';

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
  
  void _addProducts(String product)
  {
    setState(() {
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5.0),
          child: ProductControl(_addProducts),
        ),
        Products(_products),
      ],
    );
  }
}
