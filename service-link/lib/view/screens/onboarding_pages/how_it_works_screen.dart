import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HowItWorksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/animations/how_it_works_animation.json',
              height: 350, fit: BoxFit.cover),
          Text(
            "How It Works",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "Getting started is easy! Simply create an account, explore our diverse service categories, and find the perfect freelancer for your project. Post your service requests, receive offers, and choose the best match. It’s that simple! Let Service Link do the heavy lifting while you focus on what matters most.",
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
