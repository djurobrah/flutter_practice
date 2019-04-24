import 'package:flutter/material.dart';

class ProductCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: RaisedButton(
      child: Text("Create a product."),
      onPressed: () 
      {
        showModalBottomSheet(context: context, builder: (BuildContext context)
        {
          return Center(child: Text("Text, this is a modal!"));
        });
      },
    ));
  }
}
