import 'package:flutter/material.dart';

import '../../data/models/category_model.dart';
import '../../data/models/sub_category_model.dart';

final List<CategoryModel> categoriesList = [
  CategoryModel(
    id: '1',
    name: 'Home Services',
    description: 'Professional services for maintaining and improving your home.',
    icon: 'assets/icons/img.png',
  ),
  CategoryModel(
    id: '3',
    name: 'Education & Tutoring',
    description: 'Learning and tutoring services across various subjects.',
    icon: 'assets/icons/img.png',
  ),
  CategoryModel(
    id: '5',
    name: 'Business & Finance',
    description: 'Professional financial and business services.',
    icon: 'assets/icons/business_finance.png',
  ),
];