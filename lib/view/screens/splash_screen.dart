import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:service_link/app/routes/app_routes.dart';
import '../../viewmodels/splash_viewmodel.dart';
import 'package:service_link/core/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final status = SplashViewModel().checkStatus();

    Future.delayed(const Duration(seconds: 3), () async {
        switch (await status) {
          case -1:
            Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
            break;
          case 0:
            Navigator.pushReplacementNamed(context, AppRoutes.main);
            break;
          case 1:
            Navigator.pushReplacementNamed(context, AppRoutes.login);
            break;
        }
      });

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(child: Image.asset('assets/images/logo_2_rem_bg.png')),
      ),
    );
  }
}
