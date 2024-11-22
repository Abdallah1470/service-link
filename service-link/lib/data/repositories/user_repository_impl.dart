import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:service_link/data/repositories/user_repository.dart';

import '../models/company_model.dart';
import '../models/notification_model.dart';
import '../models/order_model.dart';
import '../models/promotion_model.dart';
import '../models/user_model.dart';
import '../models/worker_model.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore firestore;

  UserRepositoryImpl(this.firestore);

  @override
  Future<UserModel?> getUser(String userId) async {
    final doc = await firestore.collection('users').doc(userId).get();
    if (doc.exists) {
      final data = doc.data()!;
      if (data['role'] == 'worker') {
        return WorkerModel(
          user: UserModel(
            id: doc.id,
            name: data['name'],
            email: data['email'],
            phoneNumber: data['phoneNumber'],
            role: UserRole.values.firstWhere((e) => e.toString().split('.').last == data['role']),
            city: data['city'],
            dateOfBirth: DateTime.parse(data['dateOfBirth']),
            profileImageUrl: data['profileImageUrl'],
            registrationDate: (data['registrationDate'] as Timestamp).toDate(),
            fcmToken: data['fcmToken'],
            notificationsHistory: (data['notificationsHistory'] as List)
                .map((item) => NotificationModel.fromJson(item))
                .toList(),
            ordersHistory: (data['ordersHistory'] as List)
                .map((item) => OrderModel.fromJson(item))
                .toList(),
            promotionsHistory: (data['promotionsHistory'] as List)
                .map((item) => PromotionModel.fromJson(item))
                .toList(),
          ),
          category: data['category'],
          averageRating: data['rating'],
          numberOfReviews: data['completedJobs'],
        );
      } else if (data['role'] == 'company') {
        // Fetch company employees as well
        final employeeDocs = await firestore
            .collection('users')
            .doc(userId)
            .collection('employees')
            .get();
        final employees = employeeDocs.docs.map((doc) {
          final workerData = doc.data();
          return WorkerModel(
            user: UserModel(
              id: doc.id,
              name: workerData['name'],
              email: workerData['email'],
              phoneNumber: workerData['phoneNumber'],
              role: UserRole.worker,
              city: workerData['city'],
              dateOfBirth: DateTime.parse(workerData['dateOfBirth']),
              profileImageUrl: workerData['profileImageUrl'],
              registrationDate:
                  (workerData['registrationDate'] as Timestamp).toDate(),
              fcmToken: workerData['fcmToken'],
              notificationsHistory: (workerData['notificationsHistory'] as List)
                  .map((item) => NotificationModel.fromJson(item))
                  .toList(),
              ordersHistory: (workerData['ordersHistory'] as List)
                  .map((item) => OrderModel.fromJson(item))
                  .toList(),
              promotionsHistory: (workerData['promotionsHistory'] as List)
                  .map((item) => PromotionModel.fromJson(item))
                  .toList(),
            ),
            category: workerData['category'],
            averageRating: workerData['rating'],
            numberOfReviews: workerData['completedJobs'],
          );
        }).toList();

        return CompanyModel(
          user: UserModel(
            id: doc.id,
            name: data['name'],
            email: data['email'],
            phoneNumber: data['phoneNumber'],
            role: UserRole.values.firstWhere((e) => e.toString().split('.').last == data['role']),
            city: data['city'],
            dateOfBirth: DateTime.parse(data['dateOfBirth']),
            profileImageUrl: data['profileImageUrl'],
            registrationDate: (data['registrationDate'] as Timestamp).toDate(),
            fcmToken: data['fcmToken'],
            notificationsHistory: (data['notificationsHistory'] as List)
                .map((item) => NotificationModel.fromJson(item))
                .toList(),
            ordersHistory: (data['ordersHistory'] as List)
                .map((item) => OrderModel.fromJson(item))
                .toList(),
            promotionsHistory: (data['promotionsHistory'] as List)
                .map((item) => PromotionModel.fromJson(item))
                .toList(),
          ),
          businessName: data['businessName'],
          companyRegistrationNumber: data['companyRegistrationNumber'],
          employees: employees,
        );
      } else {
        return UserModel(
          id: doc.id,
          name: data['name'],
          email: data['email'],
          phoneNumber: data['phoneNumber'],
          role: UserRole.values.firstWhere((e) => e.toString().split('.').last == data['role']),
          city: data['city'],
          dateOfBirth: DateTime.parse(data['dateOfBirth']),
          profileImageUrl: data['profileImageUrl'],
          registrationDate: (data['registrationDate'] as Timestamp).toDate(),
          fcmToken: data['fcmToken'],
          notificationsHistory: (data['notificationsHistory'] as List)
              .map((item) => NotificationModel.fromJson(item))
              .toList(),
          ordersHistory: (data['ordersHistory'] as List)
              .map((item) => OrderModel.fromJson(item))
              .toList(),
          promotionsHistory: (data['promotionsHistory'] as List)
              .map((item) => PromotionModel.fromJson(item))
              .toList(),
        );
      }
    }
    return null;
  }

  @override
  Future<void> updateUserRole(UserModel user) async {
    await firestore.collection('users').doc(user.id).update({
      'role': user.role.toString().split('.').last,
      if (user is WorkerModel) 'category': user.category,
      if (user is CompanyModel) 'businessName': user.businessName,
    });
  }
}
