import 'package:flutter/material.dart';
import 'package:loja_bloc_provider/models/cart.model.dart';

class CartBloc extends ChangeNotifier {
  var cart = new List<CartModel>();
  double total = 0;

  get() {
    return cart;
  }

  add(CartModel item) {
    cart.add(item);
    calculateTotal();
  }

  remove(CartModel item) {
    cart.removeWhere((x) => x.id == item.id);
    calculateTotal();
  }

  itemInCart(CartModel item) {
    var result = false;
    cart.forEach((f) {
      if (item.id == f.id) result = true;
    });
    return result;
  }

  increase(CartModel item) {
    if (item.quantity < 10) {
      item.quantity++;
      calculateTotal();
    }
  }

  decrease(CartModel item) {
    if (item.quantity > 1) {
      item.quantity--;
      calculateTotal();
    }
  }

  calculateTotal() {
    total = 0;
    cart.forEach((x) {
      total += (x.price * x.quantity);
    });
    notifyListeners();
  }
}
