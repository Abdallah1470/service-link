import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/navigation_viewmodel.dart';

class MainBottomNavigationBar extends ConsumerWidget {
  const MainBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationViewModelProvider);

    return NavigationBar(
      selectedIndex: selectedIndex,
      backgroundColor: Colors.white,
      onDestinationSelected: (index) {
        ref.read(navigationViewModelProvider.notifier).changeScreen(index);
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.add_box_sharp),
          label: 'Orders',
        ),
        NavigationDestination(
          icon: Icon(Icons.card_giftcard),
          label: 'Promotions',
        ),
        NavigationDestination(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        )
      ],
    );
  }
}
