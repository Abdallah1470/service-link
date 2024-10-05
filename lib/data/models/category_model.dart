import 'package:flutter/material.dart';

import 'sub_category_model.dart';

class Category {
  final String id;
  final String name;
  final String description;
  final AssetImage icon;
  final List<SubCategory> subcategories;

  const Category(
      {required this.id,
      required this.name,
      required this.description,
      required this.icon,
      required this.subcategories});
}
