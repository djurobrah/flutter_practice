import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_practice/models/product.dart';

class ProductsModel extends Model {
  List<Product> _products = [];
  
  int _selectedProductIndex;
  
  List<Product> get products {
    return List.from(_products);
  }

  int get selectedProductIndex => _selectedProductIndex;
  
  Product get selectedProduct
  {
    if(_selectedProductIndex == null)
    {
      return null;
    }
    return _products[_selectedProductIndex];
  }

  void selectProduct(int index)
  {
    if(selectedProductIndex == null)
    {
      _selectedProductIndex = index;
    }
  }

  void addProduct(Product product) {
    _products.add(product);
    _selectedProductIndex = null;
  }

  void updateProduct(Product product) {
    _products[_selectedProductIndex] = product;
    _selectedProductIndex = null;
  }

  void deleteProduct() {
    _products.removeAt(_selectedProductIndex);
    _selectedProductIndex = null;
  }
}
