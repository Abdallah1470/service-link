import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/company_model.dart';
import '../data/models/user_model.dart';
import '../data/models/worker_model.dart';
import '../data/repositories/providers.dart';

class UserViewModel extends StateNotifier<User?> {
  final Ref ref;

  UserViewModel(this.ref) : super(null);

  Future<void> fetchUser(String userId) async {
    final userData = await ref.read(userRepositoryProvider).getUser(userId);
    state = userData;
  }

  Future<void> becomeWorker(String category) async {
    if (state != null && state!.role == 'user') {
      final worker = Worker(
        id: state!.id,
        name: state!.name,
        email: state!.email,
        phoneNumber: state!.phoneNumber,
        registrationDate: state!.registrationDate,
        category: category,
      );
      await ref.read(userRepositoryProvider).updateUserRole(worker);
      state = worker;
    }
  }

  Future<void> becomeCompany(String businessName, String companyRegNo) async {
    if (state != null && state!.role == 'user') {
      final company = Company(
        id: state!.id,
        name: state!.name,
        email: state!.email,
        phoneNumber: state!.phoneNumber,
        registrationDate: state!.registrationDate,
        businessName: businessName,
        companyRegistrationNumber: companyRegNo,
      );
      await ref.read(userRepositoryProvider).updateUserRole(company);
      state = company;
    }
  }
}

final userViewModelProvider = StateNotifierProvider<UserViewModel, User?>((ref) {
  return UserViewModel(ref);
});
