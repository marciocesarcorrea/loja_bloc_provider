import 'package:dio/dio.dart';
import 'package:loja_bloc_provider/models/category.model.dart';
import 'package:loja_bloc_provider/settings.dart';

class CategoryRepository {
  Future<List<CategoryModel>> getAll() async {
    var url = "${Settings.apiUrl}v1/categories";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((f) => CategoryModel.fromJson(f))
        .toList();
  }
}
