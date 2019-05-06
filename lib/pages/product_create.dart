import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  _ProductCreatePageState createState() => _ProductCreatePageState();
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _descValue = '';
  double _priceValue = 0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
      onSaved: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Description'),
      maxLines: 2,
      onSaved: (String value) {
        setState(() {
          _descValue = value;
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Price'),
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  _submitForm() {
    _formKey.currentState.save();
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'desc': _descValue,
      'price': _priceValue,
      'image': "assets/image.jpg"
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, "/products");
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
          children: <Widget>[
            _buildTitleTextField(),
            _buildDescTextField(),
            _buildPriceTextField(),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text('Save'),
              textColor: Colors.white,
              onPressed: _submitForm,
            )
          ],
        ),
      ),
    );
  }
}
