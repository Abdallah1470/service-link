import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/company_model.dart';
import '../models/worker_model.dart';
import '../models/user_model.dart';
import '../models/notification_model.dart';
import '../models/order_model.dart';
import '../models/promotion_model.dart';
import 'company_repository.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final FirebaseFirestore firestore;

  CompanyRepositoryImpl(this.firestore);

  @override
  Future<CompanyModel?> getCompany(String companyId) async {
    final doc = await firestore.collection('users').doc(companyId).get();
    if (doc.exists && doc.data()!['role'] == 'company') {
      final data = doc.data()!;
      final employeeDocs = await firestore.collection('users').doc(companyId).collection('employees').get();
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
            registrationDate: (workerData['registrationDate'] as Timestamp).toDate(),
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
          role: UserRole.company,
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
    }
    return null;
  }

  @override
  Future<void> addWorker(String companyId, WorkerModel worker) async {
    await firestore.collection('users').doc(companyId).collection('employees').add({
      'name': worker.user.name,
      'email': worker.user.email,
      'phoneNumber': worker.user.phoneNumber,
      'registrationDate': worker.user.registrationDate,
      'category': worker.category,
      'rating': worker.averageRating,
      'completedJobs': worker.numberOfReviews,
    });
  }
}