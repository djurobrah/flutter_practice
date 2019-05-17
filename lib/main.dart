import 'package:flutter/material.dart';

import 'package:flutter_practice/pages/auth.dart';
import 'package:flutter_practice/pages/product.dart';
import 'package:flutter_practice/pages/products.dart';
import 'package:flutter_practice/pages/products_admin.dart';
import 'package:flutter_practice/models/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Product> _products = [];

  void _addProducts(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  void _updateProduct(int index, Product product) {
    setState(() {
      _products[index] = product;
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
        fontFamily: 'Montserrat',
        buttonColor: Colors.deepPurple,
      ),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) => ProductAdminPage(
            _addProducts, _updateProduct, _deleteProduct, _products),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split("/");
        if (pathElements[0] != "") {
          return null;
        }
        if (pathElements[1] == "product") {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(
                  _products[index].title,
                  _products[index].image,
                  _products[index].price,
                  _products[index].description));
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(_products));
      },
    );
  }
}
