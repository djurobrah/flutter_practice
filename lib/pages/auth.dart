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

  DecorationImage _buildBackgroundImage()
  {
    return DecorationImage(
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.1),
        BlendMode.dstATop,
      ),
      fit: BoxFit.cover,
      image: AssetImage("assets/bg.jpg"),
    );
  }
  
  Widget _buildEmailTextField()
  {
    return TextField(
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
    );
  }

  Widget _buildPasswordTextField()
  {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Password',
        filled: true,
        fillColor: Colors.white,
      ),
      onChanged: (String value) {
        _passwordValue = value;
      },
      obscureText: true,
    );
  }
  
  Widget _buildAcceptSwitch()
  {
    return SwitchListTile(
      value: _acceptTerms,
      title: Text("Accept Terms"),
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
    );
  }
  
  _submitForm()
  {
      Navigator.pushReplacementNamed(context, "/products");
      print(_emailValue + " " + _passwordValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildEmailTextField(),
                SizedBox(height: 10.0),
                _buildPasswordTextField(),
                _buildAcceptSwitch(),
                SizedBox(height: 20.0),
                RaisedButton(
                  child: Text("Log In"),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  onPressed: _submitForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
