import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:service_link/data/models/order_model.dart' as order_model;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:service_link/data/repositories/auth_repository.dart';
import '../data/models/notification_model.dart';
import '../domain/entities/auth_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'notification_viewmodel.dart';
import 'order_viewmodel.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(ref),
);

class AuthViewModel extends StateNotifier<AuthState> {
  final Ref ref;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? errorMessage;

  AuthViewModel(this.ref) : super(AuthState());

  Future<void> signInWithEmailPassword() async {
    state = state.copyWith(isLoading: true);
    if (_validateForm()) {
      try {
        await ref.read(authRepositoryProvider).signInWithEmailPassword(
              emailController.text.trim(),
              passwordController.text.trim(),
            );

        // Access current user directly after sign-in
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          await _saveUserToFirestore(user);
          state = state.copyWith(isAuthenticated: true);
        } else {
          state = state.copyWith(errorMessage: "User not found.");
        }
      } catch (e) {
        state = state.copyWith(errorMessage: e.toString());
      }
    } else {
      state = state.copyWith(errorMessage: "Please enter valid credentials");
    }
    state = state.copyWith(isLoading: false);
  }

  Future<void> signUpWithEmailPassword() async {
    state = state.copyWith(isLoading: true);
    if (_validateForm() && _validatePasswordMatch()) {
      try {
        await ref.read(authRepositoryProvider).signUpWithEmailPassword(
              emailController.text.trim(),
              passwordController.text.trim(),
            );

        // Access current user directly after sign-up
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          await _saveUserToFirestore(user);
          state = state.copyWith(isAuthenticated: true);
        } else {
          state = state.copyWith(errorMessage: "User not found.");
        }
      } catch (e) {
        state = state.copyWith(errorMessage: e.toString());
      }
    } else {
      state = state.copyWith(
          errorMessage:
              "Please enter valid credentials and matching passwords");
    }
    state = state.copyWith(isLoading: false);
  }

  Future<void> googleAuth() async {
    state = state.copyWith(isLoading: true);
    try {
      await ref.read(authRepositoryProvider).signInWithGoogle();

      // Access current user directly after Google sign-in
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await _saveUserToFirestore(user);
        state = state.copyWith(isAuthenticated: true);
      } else {
        state = state.copyWith(errorMessage: "User not found.");
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
    state = state.copyWith(isLoading: false);

    /////////////////////////////////////////////
    ////////////////Remove This//////////////////

    order_model.OrderModel newOrder = order_model.OrderModel(
      id: '', // Firestore will generate the ID
      title: 'Order Title',
      description: 'Order Description',
      state: order_model.OrderStatus.Pending,
      timestamp: Timestamp.now(),
    );

// Add the order
    await ref.read(orderViewModelProvider(FirebaseAuth.instance.currentUser!.uid).notifier).addOrder(newOrder);

    final userId = FirebaseAuth.instance.currentUser!.uid;

// Create a Notification instance
    NotificationModel newNotification = NotificationModel(
      id: '', // Firestore will generate the ID
      title: 'Announcement',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
      state: NotificationState.Announcements,
      timestamp: Timestamp.now(),
    );

// Add the notification
    await ref.read(notificationViewModelProvider(userId).notifier).addNotification(newNotification);

    NotificationModel newNotification2 = NotificationModel(
      id: '',
      title: 'Order Cancelled',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
      state: NotificationState.OrderCancelled,
      timestamp: Timestamp.now(),
    );

    await ref.read(notificationViewModelProvider(userId).notifier).addNotification(newNotification2);

    NotificationModel newNotification3 = NotificationModel(
      id: '',
      title: 'Order Assigned',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
      state: NotificationState.OrderAssigned,
      timestamp: Timestamp.now(),
    );

    await ref.read(notificationViewModelProvider(userId).notifier).addNotification(newNotification3);

    NotificationModel newNotification4 = NotificationModel(
      id: '',
      title: 'Order Completed',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
      state: NotificationState.OrderCompleted,
      timestamp: Timestamp.now(),
    );

    await ref.read(notificationViewModelProvider(userId).notifier).addNotification(newNotification4);

    NotificationModel newNotification5 = NotificationModel(
      id: '',
      title: 'Confirmed Order',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
      state: NotificationState.ConfirmedOrder,
      timestamp: Timestamp.now(),
    );

    await ref.read(notificationViewModelProvider(userId).notifier).addNotification(newNotification5);

    NotificationModel newNotification6 = NotificationModel(
      id: '',
      title: 'Order Accepted',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
      state: NotificationState.OrderAccepted,
      timestamp: Timestamp.now(),
    );

    await ref.read(notificationViewModelProvider(userId).notifier).addNotification(newNotification6);
    /////////////////////////////////////////////
    ////////////////Remove This//////////////////
  }

  Future<void> signInWithPhone(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      await ref.read(authRepositoryProvider).signInWithPhone(context);

      // Access current user directly after phone sign-in
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await _saveUserToFirestore(user);
        state = state.copyWith(isAuthenticated: true);
      } else {
        state = state.copyWith(errorMessage: "User not found.");
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
    state = state.copyWith(isLoading: false);
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true);
    try {
      await ref.read(authRepositoryProvider).signOut();
      state = state.copyWith(isAuthenticated: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
    state = state.copyWith(isLoading: false);
  }

  Future<void> _saveUserToFirestore(User user) async {
  try {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    String? token = await FirebaseMessaging.instance.getToken();

    final userData = {
      'id': user.uid,
      'name': user.displayName ?? 'No Name',
      'email': user.email,
      'phoneNumber': '', // Initialize with empty string or default value
      'role': 'user',
      'city': '', // Initialize with empty string or default value
      'dateOfBirth': DateTime.now().toIso8601String(), // Initialize with current date or default value
      'profileImageUrl': '', // Initialize with empty string or default value
      'registrationDate': FieldValue.serverTimestamp(),
      'fcmToken': token,
      'notificationsHistory': [], // Initialize with empty list
      'ordersHistory': [], // Initialize with empty list
      'promotionsHistory': [], // Initialize with empty list
    };

    if (!doc.exists) {
      // If the user document does not exist, create it
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set(userData);
      log("User saved to Firestore!");
    } else {
      // Update the FCM token and other fields if necessary
      await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'fcmToken': token,
        // Add other fields to update if necessary
      });
      log("User already exists in Firestore. FCM token updated.");
    }
  } catch (e) {
    log("Error saving user to Firestore: $e");
  }
}

  bool _validateForm() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        emailController.text.contains('@');
  }

  bool _validatePasswordMatch() {
    return passwordController.text == confirmPasswordController.text;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
