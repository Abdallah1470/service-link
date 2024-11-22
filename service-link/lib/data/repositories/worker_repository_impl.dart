import 'package:cloud_firestore/cloud_firestore.dart';
import 'worker_repository.dart';

import '../models/worker_model.dart';
import '../models/user_model.dart';
import '../models/notification_model.dart';
import '../models/order_model.dart';
import '../models/promotion_model.dart';

class WorkerRepositoryImpl implements WorkerRepository {
  final FirebaseFirestore firestore;

  WorkerRepositoryImpl(this.firestore);

  @override
  Future<WorkerModel?> getWorker(String workerId) async {
    final doc = await firestore.collection('users').doc(workerId).get();
    if (doc.exists && doc.data()!['role'] == 'worker') {
      final data = doc.data()!;
      return WorkerModel(
        user: UserModel(
          id: doc.id,
          name: data['name'],
          email: data['email'],
          phoneNumber: data['phoneNumber'],
          role: UserRole.worker,
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
    }
    return null;
  }
}