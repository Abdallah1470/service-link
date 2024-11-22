import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GetStartedScreen extends StatelessWidget {
  final void Function() completeOnboarding;

  GetStartedScreen(this.completeOnboarding);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/animations/get_started_animation.json',
              height: 350, fit: BoxFit.cover),
          const SizedBox(height: 20),
          Text(
            "Get Started",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "Ready to take the next step? Download the app now and unlock a world of possibilities! Whether you're looking to hire or offer your skills, Service Link is here to facilitate your journey. Join us today and connect with trusted professionals who are just a click away!",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 36),
          ElevatedButton(
            onPressed: () {
              completeOnboarding();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Start Now"),
          ),
        ],
      ),
    );
  }
}
