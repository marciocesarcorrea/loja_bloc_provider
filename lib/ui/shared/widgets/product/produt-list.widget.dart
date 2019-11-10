import 'package:flutter/material.dart';
import 'package:loja_bloc_provider/models/product.model.dart';
import 'package:loja_bloc_provider/ui/shared/widgets/product/product-card.widget.dart';
import 'package:loja_bloc_provider/ui/shared/widgets/shared/loader.widget.dart';

class ProductList extends StatelessWidget {
  final List<ProductModel> products;
  ProductList({
    @required this.products,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      child: Loader(
        callback: list,
        object: products,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (_context, index) {
        return Padding(
          padding: EdgeInsets.all(5),
          child: ProductCard(
            item: products[index],
          ),
        );
      },
    );
  }
}
