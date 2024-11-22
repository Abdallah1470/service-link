import 'sub_category_model.dart';

class CategoryModel {
  final String id;
  final String name;
  final String description;
  final String icon; // Changed AssetImage to String for easier serialization

  const CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'icon': icon,
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}
