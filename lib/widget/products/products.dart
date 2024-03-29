import 'package:flutter/material.dart';
import 'package:flutter_practice/scoped-models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_practice/models/product.dart';

import 'package:flutter_practice/widget/products/product_card.dart';

class Products extends StatelessWidget {
  Widget _buildProductList(List<Product> products) {
    if (products.length > 0) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(index, products[index]),
        itemCount: products.length,
      );
    }
    return Center(
      child: Text("No products found, please add some!"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildProductList(model.displayedProducts);
      },
    );
  }
}
