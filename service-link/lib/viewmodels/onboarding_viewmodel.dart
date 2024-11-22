import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingViewModelProvider = ChangeNotifierProvider((ref) => OnboardingViewModel());

class OnboardingViewModel extends ChangeNotifier {
  int currentPage = 0;

  void setPage(int pageIndex) {
    currentPage = pageIndex;
    notifyListeners();
  }
}
