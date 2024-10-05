import 'package:flutter_riverpod/flutter_riverpod.dart';

// Navigation ViewModel for managing the current bottom navigation index
class NavigationViewModel extends StateNotifier<int> {
  NavigationViewModel() : super(0);

  // Method to change the screen index
  void changeScreen(int index) {
    state = index;
  }
}

// Provider for NavigationViewModel
final navigationViewModelProvider = StateNotifierProvider<NavigationViewModel, int>((ref) {
  return NavigationViewModel();
});
