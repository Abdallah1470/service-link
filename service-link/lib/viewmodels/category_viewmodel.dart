import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/category_model.dart';
import '../data/repositories/categories_repository.dart';
import '../data/repositories/providers.dart';

class CategoryViewModel extends StateNotifier<List<CategoryModel>> {
  final CategoriesRepository repository;

  CategoryViewModel(this.repository) : super([]);

  void loadCategories() {
    state = repository.getCategories();
  }
}

final categoriesProvider = StateNotifierProvider<CategoryViewModel, List<CategoryModel>>((ref) {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);
  return CategoryViewModel(categoriesRepository);
});
