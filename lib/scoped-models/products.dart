import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_practice/models/product.dart';

class ProductsModel extends Model {
  List<Product> _products = [];

  int _selectedProductIndex;

  List<Product> get products {
    return List.from(_products);
  }

  int get selectedProductIndex => _selectedProductIndex;

  Product get selectedProduct {
    if (_selectedProductIndex == null) {
      return null;
    }
    return _products[_selectedProductIndex];
  }

  void selectProduct(int index) {
    if (selectedProductIndex == null) {
      _selectedProductIndex = index;
      notifyListeners();
    }
  }

  void addProduct(Product product) {
    _products.add(product);
    _selectedProductIndex = null;
    notifyListeners();
  }

  void updateProduct(Product product) {
    _products[_selectedProductIndex] = product;
    _selectedProductIndex = null;
    notifyListeners();
  }

  void toggleFavorite() {
    final bool isCurrentlyFavorite = selectedProduct.isFavorite;
    final bool isFavorite = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        isFavorite: isFavorite);
    _products[_selectedProductIndex] = updatedProduct;
    _selectedProductIndex = null;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(_selectedProductIndex);
    _selectedProductIndex = null;
    notifyListeners();
  }
}