import 'package:flutter_practice/scoped-models/products.dart';
import 'package:flutter_practice/scoped-models/user.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model with UserModel, ProductsModel
{

}