import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_link/app/routes/app_routes.dart';
import 'package:service_link/viewmodels/auth_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/shared_preferences_service.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final authState = ref.watch(authViewModelProvider);
    final authViewModel = ref.read(authViewModelProvider.notifier);
    final isPasswordVisible = ref.watch(passwordVisibilityProvider);

    if (authState.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.main,
          (route) => false,
        );
        final prefsService =
            SharedPreferencesService(await SharedPreferences.getInstance());
        prefsService.setLoggedIn(true);
      });
    }

    void submitForm() {
      final isValid = formKey.currentState!.validate();
      if (!isValid) {
        return;
      }
      formKey.currentState!.save();
      authViewModel.signInWithEmailPassword();
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFCCFD04), Color(0xFF0F9918)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo_2_rem_bg.png',
                height: 130,
                width: 250,
                color: Colors.white,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                width: 550,
                child: Card(
                  color: Colors.white.withOpacity(0.58),
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Text(
                            'Login',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, AppRoutes.signUp);
                                },
                                child: const Text("Don't have an account? Sign Up",
                                    style: TextStyle(color: Color(0xFF0F9918))),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
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
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  // Toggle the visibility state
                                  ref
                                      .read(passwordVisibilityProvider.notifier)
                                      .state = !isPasswordVisible;
                                },
                              ),
                            ),
                            obscureText: !isPasswordVisible,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text("Forgot Password?"),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () => submitForm(),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 48),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor:
                                  Theme.of(context).colorScheme.onSecondary,
                            ),
                            child: const Text("Sign In"),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'or',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 24),
                          OutlinedButton.icon(
                            label: Text('Continue with Google'),
                            icon: SvgPicture.asset(
                              'assets/icons/google.svg',
                              width: 24,
                            ),
                            onPressed: () => authViewModel.googleAuth(),
                          ),
                          OutlinedButton.icon(
                            onPressed: () =>
                                authViewModel.signInWithPhone(context),
                            label: const Text("Continue with Phone"),
                            icon: const Icon(Icons.phone),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
