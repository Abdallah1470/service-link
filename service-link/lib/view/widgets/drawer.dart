import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:service_link/view/widgets/drawer_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/routes/app_routes.dart';
import '../../core/utils/shared_preferences_service.dart';
import '../../viewmodels/auth_viewmodel.dart';

class MainDrawer extends ConsumerWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.read(authViewModelProvider.notifier);
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      width: MediaQuery.of(context).size.width * 0.75,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.greenAccent[200],
            ),
            child: Center(
              child: Image.asset(
                  'assets/images/logo_2_rem_bg.png',
                  width:200,
                  height: 200,
                  fit: BoxFit.cover,
                color: Colors.white,
              )
            ),
          ),
          drawerItem(
              leadingImageAsset: 'assets/images/user.png',
              text: 'My Profile',
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.profile);
              }),
          drawerItem(
              leadingImageAsset: 'assets/images/contacts.png',
              text: 'Contact US',
              onTap: () {}),
          const SizedBox(height: 10),
          drawerItem(
              leadingImageAsset: 'assets/images/construction_worker.png',
              text: 'Become A Worker',
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.becomeWorker);
              }),
          drawerItem(
              leadingImageAsset: 'assets/images/bricks.png',
              text: 'Become A Company',
              onTap: () {}),
          const SizedBox(height: 10),
          drawerItem(
              leadingImageAsset: 'assets/images/share.png',
              text: 'Share',
              onTap: () {}),
          drawerItem(
              leadingImageAsset: 'assets/images/star.png',
              text: 'Rate',
              onTap: () {}),
          const SizedBox(height: 10),
          drawerItem(
              leadingImageAsset: 'assets/images/logout.png',
              text: 'Logout',
              onTap: () async {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.warning,
                  title: 'Logout',
                  text: 'Are you sure you want to logout?',
                  textAlignment: TextAlign.center,
                  cancelBtnText: 'No',
                  showCancelBtn: true,
                  onCancelBtnTap: () {
                    Navigator.of(context).pop();
                  },
                  confirmBtnText: 'Yes',
                  onConfirmBtnTap: () async {
                    Navigator.of(context).pop();
                    authViewModel.signOut();
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.login, (route) => false);
                    final prefsService = SharedPreferencesService(
                        await SharedPreferences.getInstance());
                    prefsService.setLoggedIn(false);
                  },
                );
              }),
        ],
      ),
    );
  }
}
