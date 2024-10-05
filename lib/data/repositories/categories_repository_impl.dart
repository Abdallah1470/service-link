import '../../core/constants/categories_list.dart';
import '../models/category_model.dart';
import 'categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {

  @override
  List<Category> getCategories()  {
    return categoriesList;
  }
}
