import 'package:flutter/material.dart';
import 'package:flutter_practice/models/product.dart';

import 'package:flutter_practice/widget/products/product_card.dart';

class Products extends StatelessWidget {
  final List<Product> products;

  Products(this.products);

  Widget _buildProductList() {
    if (products.length > 0) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) => ProductCard(index, products[index]),
        itemCount: products.length,
      );
    }
    return Center(
      child: Text("No products found, please add some!"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
