import 'package:flutter/material.dart';
import 'package:flutter_practice/scoped-models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptTerms': false
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.1),
        BlendMode.dstATop,
      ),
      fit: BoxFit.cover,
      image: AssetImage("assets/bg.jpg"),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'E-mail',
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Email field cannot be empty.";
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Email must be valid.';
        }
      },
      onSaved: (String value) => _formData['email'] = value,
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return "Password cannot be empty or shorter than 6 characters.";
        }
      },
      onSaved: (String value) => _formData['password'] = value,
      obscureText: true,
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: _formData['acceptTerms'],
      title: Text("Accept Terms"),
      onChanged: (bool value) {
        setState(() {
          _formData['acceptTerms'] = value;
        });
      },
    );
  }

  _submitForm(Function login) {
    if (!_formKey.currentState.validate() ||
        _formData['acceptTerms'] == false) // validates all Form Fields
    {
      return; // stops the rest of the code from executing if not all Form Fields are valid
    }
    _formKey.currentState.save();
    login(_formData['email'], _formData['password']);
    Navigator.pushReplacementNamed(context, "/products");
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

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
            child: Container(
              width: targetWidth,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    SizedBox(height: 10.0),
                    _buildPasswordTextField(),
                    _buildAcceptSwitch(),
                    SizedBox(height: 20.0),
                    ScopedModelDescendant<MainModel>(
                      builder: (
                        BuildContext context,
                        Widget child,
                        MainModel model,
                      ) {
                        return RaisedButton(
                          child: Text("Log In"),
                          textColor: Colors.white,
                          onPressed: () => _submitForm(model.login),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
