import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:service_link/data/repositories/rating_repository.dart';
import 'package:service_link/data/repositories/rating_repository_impl.dart';
import 'package:service_link/data/repositories/user_repository_impl.dart';
import 'package:service_link/data/repositories/worker_repository.dart';
import 'package:service_link/data/repositories/worker_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utils/shared_preferences_service.dart';
import '../../domain/interfaces/preferences_repository.dart';
import 'categories_repository.dart';
import 'categories_repository_impl.dart';
import 'company_repository.dart';
import 'company_repository_impl.dart';
import 'notification_repository-impl.dart';
import 'order_repository_impl.dart';
import 'user_repository.dart';
import 'order_repository.dart';
import 'notification_repository.dart';

// Create a provider for SharedPreferences
final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final categoriesRepositoryProvider = Provider<CategoriesRepository>((ref) {
  return CategoriesRepositoryImpl();
});

final ratingRepositoryProvider = Provider<RatingRepository>((ref) {
  return RatingRepositoryImpl(FirebaseFirestore.instance);
});

final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.read(firestoreProvider));
});

final workerRepositoryProvider = Provider<WorkerRepository>((ref) {
  return WorkerRepositoryImpl(ref.read(firestoreProvider));
});

final companyRepositoryProvider = Provider<CompanyRepository>((ref) {
  return CompanyRepositoryImpl(ref.read(firestoreProvider));
});

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  return OrderRepositoryImpl(ref.read(firestoreProvider));
});

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepositoryImpl(ref.read(firestoreProvider));
});
