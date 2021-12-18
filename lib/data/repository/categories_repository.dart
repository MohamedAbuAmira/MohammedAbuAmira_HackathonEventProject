

import 'package:elancer_hackathon/data/models/category.dart';
import 'package:elancer_hackathon/data/web_service/categories_web_service.dart';

class CategoryRepository {
  final CategoriesWebService categoriesWebService;

  CategoryRepository(this.categoriesWebService);

  Future<List<Category>> getAllCategories() async {
    final categories = await categoriesWebService.getCategories();
    // print(categories.toList());
    return categories.map((category) => Category.fromJson(category)).toList();
  }
}
