import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_link/viewmodels/auth_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/utils/shared_preferences_service.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);
    final authViewModel = ref.read(authViewModelProvider.notifier);
    final isPasswordVisible = ref.watch(passwordVisibilityProvider);
    final isConfirmPasswordVisible =
        ref.watch(confirmPasswordVisibilityProvider);

    if (authState.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.main,
          (route) => false,
        );
        final prefsService = SharedPreferencesService(await SharedPreferences.getInstance());
        prefsService.setLoggedIn(true);
      });
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/img.png',
              width: 120,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              controller: authViewModel.emailController,
              validator: emailValidator,
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: authViewModel.passwordController,
              keyboardType: TextInputType.visiblePassword,
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              validator: passwordValidator,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                labelText: 'Password',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    // Toggle the visibility state
                    ref.read(passwordVisibilityProvider.notifier).state =
                        !isPasswordVisible;
                  },
                ),
              ),
              obscureText: !isPasswordVisible,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: authViewModel.confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              validator: passwordValidator,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    // Toggle the visibility state
                    ref.read(confirmPasswordVisibilityProvider.notifier).state =
                        !isConfirmPasswordVisible;
                  },
                ),
              ),
              obscureText: !isConfirmPasswordVisible,
            ),
            const SizedBox(height: 36),
            ElevatedButton(
              onPressed: () => authViewModel.signUpWithEmailPassword(),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onSecondary),
              child: const Text("Sign Up"),
            ),
            const SizedBox(height: 24),
            Text(
              'or',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              label: const Text('Continue with Google'),
              icon: SvgPicture.asset(
                'assets/icons/google.svg',
                width: 24,
              ),
              onPressed: () => authViewModel.googleAuth(),
            ),
            OutlinedButton.icon(
              onPressed: () => authViewModel.signInWithPhone(context),
              label: const Text("Continue with Phone"),
              icon: const Icon(Icons.phone),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Go back to login
              },
              child: const Text("Already have an account? Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email address is required';
  }

  // Regular expression to check if the email format is valid
  final RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$",
  );

  if (!emailRegExp.hasMatch(value)) {
    return 'Enter a valid email address';
  }

  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }

  return null;
}

final passwordVisibilityProvider = StateProvider<bool>((ref) => false);
final confirmPasswordVisibilityProvider = StateProvider<bool>((ref) => false);
