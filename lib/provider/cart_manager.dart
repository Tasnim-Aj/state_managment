import 'package:flutter/material.dart';

import '../model/cart_model.dart';
import '../model/product_model.dart';

class CartManager extends ChangeNotifier {
  List<CartModel> orders = [];
  List<ProductModel> currentCart = [];

  updateCart(ProductModel product) {
    if (currentCart.contains(product)) {
      int i = currentCart.indexOf(product);
      currentCart[i].quantity++;
    } else {
      currentCart.add(product);
    }
    notifyListeners();
  }

  // void updateCart(ProductModel product) {
  //   // التأكد إذا المنتج موجود مسبقاً لتحديث الكمية
  //   final index = currentCart.indexWhere((p) => p.id == product.id);
  //   if (index != -1) {
  //     currentCart[index].quantity++;
  //   } else {
  //     currentCart.add(ProductModel(
  //         id: product.id, name: product.name, price: product.price));
  //   }
  //   notifyListeners();
  // }

  void finalOrder() {
    if (currentCart.isNotEmpty) {
      orders.add(CartModel(products: List.from(currentCart)));
      currentCart.clear();
      notifyListeners();
    }
  }

  double getOrderPrice(CartModel order) {
    return order.products
        .fold(0, (sum, item) => sum + item.price * item.quantity);
  }
}
