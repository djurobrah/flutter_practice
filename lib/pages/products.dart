import 'package:flutter/material.dart';

import '../product_manager.dart';
import 'package:flutter_practice/pages/products_admin.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              title: Text("Manage products"),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProductAdminPage()));
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("App Title"),
      ),
      body: ProductManager(),
    );
  }
}
