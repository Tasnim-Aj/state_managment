import 'package:state_managment/model/product_model.dart';

class CartModel {
  List<ProductModel> products;
  double totalPrice = 0;

  CartModel({required this.products});
}
