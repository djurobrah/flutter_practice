import 'package:flutter/material.dart';
import 'package:flutter_practice/models/product.dart';
import 'package:flutter_practice/scoped-models/main.dart';
import 'package:flutter_practice/widget/products/address_tag.dart';

import 'package:flutter_practice/widget/products/price_tag.dart';
import 'package:flutter_practice/widget/ui_elements/title_default.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductCard extends StatelessWidget {
  final int productIndex;
  final Product product;

  ProductCard(this.productIndex, this.product);

  Widget _buildTitlePriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TitleDefault(product.title),
        SizedBox(width: 8.0),
        PriceTag(product.price.toString())
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.info,
            size: 30.0,
          ),
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/product/' + productIndex.toString()),
        ),
        ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
            return IconButton(
              icon: Icon(
                model.products[productIndex].isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 30.0,
              ),
              onPressed: () {
                model.selectProduct(productIndex);
                model.toggleFavorite();
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amberAccent,
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
          _buildTitlePriceRow(),
          AddressTag('Union Square, San Francisco'),
          _buildActionButtons(context),
        ],
      ),
    );
  }
}
