import 'package:flutter/material.dart';

import 'package:flutter_practice/products.dart';
import 'product_control.dart';

class ProductManager extends StatelessWidget {

  final List<Map<String, String>> products;
  final Function addProducts;
  final Function deleteProduct;

  ProductManager(this.products, this.addProducts, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5.0),
          child: ProductControl(addProducts),
        ),
        Expanded(
          child: Products(
            products,
            deleteProducts: deleteProduct,
          ),
        ),
      ],
    );
  }
}
