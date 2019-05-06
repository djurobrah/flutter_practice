import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_practice/widget/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String image;
  final double price;
  final String desc;

  ProductPage(this.title, this.image, this.price, this.desc);

  Row _buildAddressPriceRow()
  {
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
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            Image.asset(image),
            TitleDefault(title),
            _buildAddressPriceRow(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(desc),
            ),
          ],
        ),
      ),
    );
  }

  
}
