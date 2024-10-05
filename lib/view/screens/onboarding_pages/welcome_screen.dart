import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: (350 / 2),
            child: Lottie.asset('assets/animations/welcome_animation.json',
                height: 350, fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          Text(
            "Welcome to Service Link",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            "Welcome to Service Link! Your gateway to a world of trusted professionals. Whether you need skilled craftsmen, legal advisors, or medical experts, we connect you with verified freelancers ready to serve your needs. Join our community and experience hassle-free hiring!",
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
