
import 'package:flutter/material.dart';

import '../../data/models/category_model.dart';
import '../../data/models/sub_category_model.dart'; // Required for AssetImage

final List<Category> categoriesList = [
  Category(
    id: '1',
    name: 'Home Services',
    description: 'Professional services for maintaining and improving your home.',
    icon: AssetImage('assets/icons/img.png'),
    subcategories: [
      SubCategory(
        id: '1.1',
        name: 'Plumbing',
        description: 'Fix leaks, install water systems, and more.',
        icon: AssetImage('assets/icons/img.png'),
      ),
      SubCategory(
        id: '1.2',
        name: 'Electrician',
        description: 'Electrical repairs, installations, and maintenance.',
        icon: AssetImage('assets/icons/img.png'),
      ),
      SubCategory(
        id: '1.3',
        name: 'Painting',
        description: 'Home and commercial painting services.',
        icon: AssetImage('assets/icons/img.png'),
      ),
    ],
  ),
  Category(
    id: '3',
    name: 'Education & Tutoring',
    description: 'Learning and tutoring services across various subjects.',
    icon: AssetImage('assets/icons/img.png'),
    subcategories: [
      SubCategory(
        id: '3.1',
        name: 'Math Tutor',
        description: 'Mathematics tutoring for all levels.',
        icon: AssetImage('assets/icons/img.png'),
      ),
      SubCategory(
        id: '3.2',
        name: 'Science Tutor',
        description: 'Help with physics, chemistry, and biology.',
        icon: AssetImage('assets/icons/img.png'),
      ),
      SubCategory(
        id: '3.3',
        name: 'Language Tutor',
        description: 'Language learning for English, Spanish, and more.',
        icon: AssetImage('assets/icons/img.png'),
      ),
    ],
  ),
  Category(
    id: '5',
    name: 'Business & Finance',
    description: 'Professional financial and business services.',
    icon: AssetImage('assets/icons/business_finance.png'),
    subcategories: [
      SubCategory(
        id: '5.1',
        name: 'Accountant',
        description: 'Accounting, bookkeeping, and tax services.',
        icon: AssetImage('assets/icons/accountant.png'),
      ),
      SubCategory(
        id: '5.2',
        name: 'Financial Advisor',
        description: 'Investment and financial planning services.',
        icon: AssetImage('assets/icons/financial_advisor.png'),
      ),
      SubCategory(
        id: '5.3',
        name: 'Business Consultant',
        description: 'Advice and strategies for growing your business.',
        icon: AssetImage('assets/icons/business_consultant.png'),
      ),
    ],
  ),
];
