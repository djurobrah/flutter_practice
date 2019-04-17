import 'package:flutter/material.dart';

import 'pages/product.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products(this.products);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      color: Colors.amberAccent,
      child: Column(
        children: <Widget>[
          Image.asset("assets/image.jpg"),
          Text(products[index]),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("Details"),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => ProductPage()),
                    ),
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
