import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProducts;

  ProductControl(this.addProducts);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      child: Text("Press me!"),
      onPressed: () {
        addProducts("Adding product.");
      },
    );
  }
}
