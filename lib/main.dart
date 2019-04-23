import 'package:flutter/material.dart';

import 'package:flutter_practice/pages/auth.dart';
import 'package:flutter_practice/pages/products.dart';
import 'package:flutter_practice/pages/products_admin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
//      home: AuthPage(),
      routes:
      {
        '/': (BuildContext context) => ProductsPage(),
        '/admin': (BuildContext context) => ProductAdminPage(),
      }
    );
  }
}
