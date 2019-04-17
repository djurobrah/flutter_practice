import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products(this.products);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: products
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
    );
  }
}
