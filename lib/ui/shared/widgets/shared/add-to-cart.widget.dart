import 'package:flutter/material.dart';
import 'package:loja_bloc_provider/blocs/cart.bloc.dart';
import 'package:loja_bloc_provider/models/cart.model.dart';
import 'package:loja_bloc_provider/models/product.model.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatelessWidget {
  final ProductModel item;

  AddToCart({
    @required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);
    var cart = new CartModel(
      id: item.id,
      price: item.price,
      image: item.image,
      quantity: 1,
      title: item.title,
    );

    return Container(
      width: 80,
      height: 40,
      child: FlatButton(
        color: !bloc.itemInCart(cart)
            ? Theme.of(context).primaryColor
            : Colors.red,
        child: !bloc.itemInCart(cart)
            ? Icon(Icons.add_shopping_cart)
            : Icon(Icons.remove_shopping_cart),
        textColor: Colors.white,
        onPressed: () {
          String msg = "${item.title} adicionado";
          if (!bloc.itemInCart(cart)) {
            bloc.add(cart);
          } else {
            bloc.remove(cart);
            msg = "${item.title} removido";
          }
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(msg)));
        },
      ),
    );
  }
}
