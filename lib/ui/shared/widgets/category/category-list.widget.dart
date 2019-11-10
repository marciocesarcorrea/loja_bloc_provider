import 'package:flutter/widgets.dart';
import 'package:loja_bloc_provider/models/category.model.dart';
import 'package:loja_bloc_provider/ui/shared/widgets/category/category-card.widget.dart';
import 'package:loja_bloc_provider/ui/shared/widgets/shared/loader.widget.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryModel> categories;

  CategoryList({
    @required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Loader(
        object: categories,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (_context, index) {
        CategoryModel item = categories[index];
        return Padding(
          padding: EdgeInsets.all(5),
          child: CategoryCard(
            item: item,
          ),
        );
      },
    );
  }
}
