import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;
  void toggleProduct(Product product) {
    if (_cart.contains(product)) {
      for (Product product in _cart) {
        product.quantity++;
      }
    } else {
      _cart.add(product);
    }

    notifyListeners();
  }

  incrementQuantity(int index) => _cart[index].quantity++;
  decrementQuantity(int index) => _cart[index].quantity--;

  getTotalPrice() {
    double total = 0;
    for (Product product in _cart) {
      total += product.price * product.quantity;
    }
    return total;
  }

  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of(context, listen: listen);
  }
}
