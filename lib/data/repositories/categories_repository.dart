import '../models/category_model.dart';

abstract class CategoriesRepository {
  List<Category> getCategories();
}
