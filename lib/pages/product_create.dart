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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Product Title'),
            onChanged: (String value) {
              setState(() => _titleValue = value);
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Product Description'),
            onChanged: (String value) {
              setState(() => _descValue = value);
            },
            maxLines: 2,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Product Price'),
            onChanged: (String value) {
              setState(() => _priceValue = double.parse(value));
            },
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20.0,),
          RaisedButton(
            child: Text('Save'),
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: () {
              final Map<String, dynamic> product = {
                'title': _titleValue,
                'description': _descValue,
                'price': _priceValue,
                'image': "assets/image.jpg"
              };
              widget.addProduct(product);
              Navigator.pushReplacementNamed(context, "/products");
            },
          )
        ],
      ),
    );
  }
}
