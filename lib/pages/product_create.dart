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

  Widget _buildTitleTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Title'),
      onChanged: (String value) {
        setState(() => _titleValue = value);
      },
    );
  }

  Widget _buildDescTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Description'),
      onChanged: (String value) {
        setState(() => _descValue = value);
      },
      maxLines: 2,
    );
  }

  Widget _buildPriceTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Price'),
      onChanged: (String value) {
        setState(() => _priceValue = double.parse(value));
      },
      keyboardType: TextInputType.number,
    );
  }

  _submitForm() {
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
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
        children: <Widget>[
          _buildTitleTextField(),
          _buildDescTextField(),
          _buildPriceTextField(),
          SizedBox(
            height: 20.0,
          ),
//					RaisedButton(
//						child: Text('Save'),
//						textColor: Colors.white,
//						onPressed: _submitForm,
//					)
          GestureDetector(
            onTap: _submitForm,
            child: Container(
              color: Colors.green,
              padding: EdgeInsets.all(5.0),
              child: Text("Gesture Detector."),
            ),
          )
        ],
      ),
    );
  }
}
