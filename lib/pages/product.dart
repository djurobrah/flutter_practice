import 'package:flutter/material.dart';
import 'package:flutter_practice/models/product.dart';
import 'package:flutter_practice/scoped-models/main.dart';
import 'dart:async';

import 'package:flutter_practice/widget/ui_elements/title_default.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;

  ProductPage(this.productIndex);

  Row _buildAddressPriceRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Union Square, San Francisco"),
        Container(
          child: Text("|"),
          padding: EdgeInsets.symmetric(horizontal: 10.0),
        ),
        Text("\$ " + price.toString()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('BackButtonPressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          final Product product = model.products[productIndex];
          return Scaffold(
            appBar: AppBar(
              title: Text(product.title),
            ),
            body: Column(
              children: <Widget>[
                Image.asset(product.image),
                TitleDefault(product.title),
                _buildAddressPriceRow(product.price),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product.description),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
