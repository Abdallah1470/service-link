import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../view/screens/auth/login_screen.dart';
import '../../view/screens/auth/signup_screen.dart';
import '../../view/screens/become_worker_screen.dart';
import '../../view/screens/main_screen.dart';
import '../../view/screens/main_screens/home_screen.dart';
import '../../view/screens/main_screens/notifications_screen.dart';
import '../../view/screens/main_screens/orders_screen.dart';
import '../../view/screens/main_screens/promotions_screen.dart';
import '../../view/screens/onboarding_screen.dart';
import '../../view/screens/splash_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String main = '/main';
  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String orders = '/orders';
  static const String promotions = '/promotions';
  static const String notifications = '/notifications';
  static const String becomeWorker = '/become_worker';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    onboarding: (context) => OnboardingScreen(),
    login: (context) => const LoginScreen(),
    main: (context) => MainScreen(),
    signUp: (context) => const SignupScreen(),
    home: (context) => const HomeScreen(),
    orders: (context) => const OrdersScreen(),
    promotions: (context) => const PromotionsScreen(),
    notifications: (context) => NotificationsScreen(userId: FirebaseAuth.instance.currentUser!.uid),
    becomeWorker: (context) => const BecomeWorkerScreen(),
  };
}
