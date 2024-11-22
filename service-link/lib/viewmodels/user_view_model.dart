import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer';

import '../data/models/company_model.dart';
import '../data/models/user_model.dart';
import '../data/models/worker_model.dart';
import '../data/repositories/providers.dart';

class UserViewModel extends StateNotifier<UserModel?> {
  final Ref ref;

  UserViewModel(this.ref) : super(null);

  Future<void> fetchUser(String userId) async {
    final userData = await ref.read(userRepositoryProvider).getUser(userId);
    if (userData != null) {
      log('User data fetched: ${userData.toJson()}');
    } else {
      log('User data is null');
    }
    state = userData;
  }

  Future<void> becomeWorker(String userId, String category) async {
    await fetchUser(userId); // Ensure state is initialized
    if (state != null && state!.role == UserRole.user) {
      final worker = WorkerModel(
        user: UserModel(
          id: state!.id,
          name: state!.name,
          email: state!.email,
          phoneNumber: state!.phoneNumber,
          role: UserRole.worker,
          city: state!.city,
          dateOfBirth: state!.dateOfBirth,
          profileImageUrl: state!.profileImageUrl,
          registrationDate: state!.registrationDate,
          fcmToken: state!.fcmToken,
          notificationsHistory: state!.notificationsHistory,
          ordersHistory: state!.ordersHistory,
          promotionsHistory: state!.promotionsHistory,
        ),
        category: category,
        averageRating: 0.0,
        numberOfReviews: 0,
      );
      await ref.read(userRepositoryProvider).updateUserRole(worker);
      await FirebaseFirestore.instance.collection('users').doc(worker.id).set(worker.toJson());
      state = worker;
    } else {
      log('State is null or user is not a regular user');
    }
  }

  Future<void> becomeCompany(String userId, String businessName, String companyRegNo) async {
    await fetchUser(userId); // Ensure state is initialized
    if (state != null && state!.role == UserRole.user) {
      final company = CompanyModel(
        user: UserModel(
          id: state!.id,
          name: state!.name,
          email: state!.email,
          phoneNumber: state!.phoneNumber,
          role: UserRole.company,
          city: state!.city,
          dateOfBirth: state!.dateOfBirth,
          profileImageUrl: state!.profileImageUrl,
          registrationDate: state!.registrationDate,
          fcmToken: state!.fcmToken,
          notificationsHistory: state!.notificationsHistory,
          ordersHistory: state!.ordersHistory,
          promotionsHistory: state!.promotionsHistory,
        ),
        businessName: businessName,
        companyRegistrationNumber: companyRegNo,
        employees: (state as CompanyModel).employees,
      );
      await ref.read(userRepositoryProvider).updateUserRole(company);
      state = company;
    } else {
      log('State is null or user is not a regular user');
    }
  }
}

final userViewModelProvider = StateNotifierProvider<UserViewModel, UserModel?>((ref) {
  return UserViewModel(ref);
});