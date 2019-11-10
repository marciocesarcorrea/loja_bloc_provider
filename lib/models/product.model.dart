import 'category.model.dart';

class ProductModel {
  String brand;
  CategoryModel category;
  String description;
  String id;
  String image;
  List<String> images;
  double price;
  String tag;
  String title;

  ProductModel({
    this.brand,
    this.category,
    this.description,
    this.id,
    this.image,
    this.images,
    this.price,
    this.tag,
    this.title,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    category = json['category'] != null
        ? new CategoryModel.fromJson(json['category'])
        : null;
    description = json['description'];
    id = json['id'];
    image = json['image'];
    images = json['images'];
    price = json['price'];
    tag = json['tag'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['brand'] = this.brand;
    if (this.category != null) data['category'] = this.category.toJson();
    data['description'] = this.description;
    data['id'] = this.id;
    data['image'] = this.image;
    data['images'] = this.images;
    data['price'] = this.price;
    data['tag'] = this.tag;
    data['title'] = this.title;

    return data;
  }
}
