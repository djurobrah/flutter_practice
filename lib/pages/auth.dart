import 'package:flutter/material.dart';

import 'products.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1),
                  BlendMode.dstATop,
                ),
                fit: BoxFit.cover,
                image: AssetImage("assets/bg.jpg"))),
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _emailValue = value;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (String value) {
                    _passwordValue = value;
                  },
                  obscureText: true,
                ),
                SwitchListTile(
                  value: _acceptTerms,
                  title: Text("Accept Terms"),
                  onChanged: (bool value) {
                    setState(() {
                      _acceptTerms = value;
                    });
                  },
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
        ),
      ),
    );
  }
}
