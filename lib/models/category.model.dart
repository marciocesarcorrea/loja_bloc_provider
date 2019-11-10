class CategoryModel {
  String id;
  String tag;
  String title;

  CategoryModel({
    this.id,
    this.tag,
    this.title,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tag = json['tag'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tag'] = this.tag;
    data['title'] = this.title;

    return data;
  }
}
