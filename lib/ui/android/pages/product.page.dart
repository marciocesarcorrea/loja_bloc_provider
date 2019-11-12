import 'package:flutter/material.dart';
import 'package:loja_bloc_provider/models/product.model.dart';
import 'package:loja_bloc_provider/repositories/product.repository.dart';
import 'package:loja_bloc_provider/ui/shared/widgets/shared/progress-indicator.widget.dart';

class ProductPage extends StatelessWidget {
  final String tag;
  final _repository = new ProductRepository();

  ProductPage({
    @required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductModel>(
      future: _repository.get(tag),
      builder: (context, snapshot) {
        ProductModel product = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text("Aguardando...");
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: GenericProgressindicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error),
              );
            }
            return content(product);
        }
        return null;
      },
    );
  }

  Widget content(ProductModel product) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.images.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Container(
            width: 200,
            child: Image.network(product.images[index]),
          );
        },
      ),
    );
  }
}
