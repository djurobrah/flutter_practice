import 'package:flutter/material.dart';

import 'products.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'E-mail'),
              onChanged: (String value) {
                setState(() {
                  _emailValue = value;
                });
              },
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password', ),
              onChanged: (String value) {
                _passwordValue = value;
              },
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              child: Text("Log In"),
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/products");
                print(_emailValue + " " + _passwordValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
