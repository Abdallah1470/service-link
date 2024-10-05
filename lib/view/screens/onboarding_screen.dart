import 'package:flutter/material.dart';
import 'package:service_link/core/constants/colors.dart';
import 'package:service_link/core/utils/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/routes/app_routes.dart';
import '../../data/repositories/providers.dart';
import '../../viewmodels/onboarding_viewmodel.dart';
import 'onboarding_pages/welcome_screen.dart';
import 'onboarding_pages/features_screen.dart';
import 'onboarding_pages/how_it_works_screen.dart';
import 'onboarding_pages/get_started_screen.dart';

class OnboardingScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(onboardingViewModelProvider);
    final PageController pageController = PageController();

    // Call this method when onboarding is complete
    void completeOnboarding() async {
      final prefsService = SharedPreferencesService(await SharedPreferences.getInstance());
      prefsService.setNotFirstTimeLaunch();
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                ref.read(onboardingViewModelProvider).setPage(index);
              },
              children: [
                WelcomeScreen(),
                FeaturesScreen(),
                HowItWorksScreen(),
                GetStartedScreen(completeOnboarding),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SmoothPageIndicator(
              controller: pageController,
              count: 4,
              effect: const ExpandingDotsEffect(
                activeDotColor: AppColors.secondary,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
