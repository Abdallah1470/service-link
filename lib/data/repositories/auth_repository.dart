import 'package:flutter/material.dart';
import 'package:service_link/data/services/firebase_auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.read(firebaseAuthServiceProvider));
});

class AuthRepository {
  final FirebaseAuthService _firebaseAuthService;

  AuthRepository(this._firebaseAuthService);

  Future<void> signInWithEmailPassword(String email, String password) {
    return _firebaseAuthService.signInWithEmailPassword(email, password);
  }

  Future<void> signUpWithEmailPassword(String email, String password) {
    return _firebaseAuthService.signUpWithEmailPassword(email, password);
  }

  Future<void> signInWithGoogle() {
    return _firebaseAuthService.signInWithGoogle();
  }

  Future<void> signInWithPhone(BuildContext context) {
    return _firebaseAuthService.signInWithPhone(context);
  }

  Future<void> signOut() {
    return _firebaseAuthService.signOut();
  }
}
