import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/bottom_navigation_bar.dart';
import '../../viewmodels/navigation_viewmodel.dart';
import '../widgets/drawer.dart';
import 'main_screens/home_screen.dart';
import 'main_screens/notifications_screen.dart';
import 'main_screens/orders_screen.dart';
import 'main_screens/promotions_screen.dart';

class MainScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationViewModelProvider);

    // List of screens for bottom navigation
    final List<Widget> screens = [
      const HomeScreen(),
      const OrdersScreen(),
      const PromotionsScreen(),
      NotificationsScreen(userId: FirebaseAuth.instance.currentUser!.uid),
    ];

    return Scaffold(
      drawer: const MainDrawer(), // Drawer
      body: screens[currentIndex], // Show the current screen based on index
      bottomNavigationBar: const MainBottomNavigationBar(), // Persistent bottom nav
    );
  }

  // Get the AppBar title based on the current screen
  String _getTitleForAppBar(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Profile';
      case 2:
        return 'Settings';
      default:
        return 'App';
    }
  }
}
