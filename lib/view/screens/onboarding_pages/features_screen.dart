  import 'package:flutter/material.dart';
  import 'package:lottie/lottie.dart';

  class FeaturesScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/features_animation.json',height: 350, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(
              "Discover Amazing Features",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "Discover a wide range of services at your fingertips! With Service Link, you can browse profiles, read reviews, and hire freelancers who meet your specific requirements. Enjoy features like secure payments, direct communication, and a user-friendly interface designed to make your experience seamless.",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      );
    }
  }
