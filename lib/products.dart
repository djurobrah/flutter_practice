import 'package:flutter/material.dart';

import 'pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;

  final Function deleteProducts;

  Products(this.products, {this.deleteProducts});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      color: Colors.amberAccent,
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("Details"),
                onPressed: () => Navigator.pushNamed<bool>(
                            context, '/product/' + index.toString())
                        .then((bool value) {
                      if (value) {
                        deleteProducts(index);
                      }
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    if (products.length > 0) {
      return ListView.builder(
        itemBuilder: _buildProductItem,
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
