import 'package:dio/dio.dart';
import 'package:loja_bloc_provider/models/product.model.dart';
import 'package:loja_bloc_provider/settings.dart';

class ProductRepository {
  Future<List<ProductModel>> getAll() async {
    var url = "${Settings.apiUrl}v1/products";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((f) => ProductModel.fromJson(f))
        .toList();
  }

  Future<List<ProductModel>> getByCategory(String category) async {
    var url = "${Settings.apiUrl}v1/categories/$category/products";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((f) => ProductModel.fromJson(f))
        .toList();
  }

  Future<ProductModel> get(String tag) async {
    var url = "${Settings.apiUrl}v1/products/$tag";
    Response response = await Dio().get(url);
    return ProductModel.fromJson(response.data);
  }
}
