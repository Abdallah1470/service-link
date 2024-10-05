import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:service_link/data/repositories/user_repository.dart';

import '../models/company_model.dart';
import '../models/user_model.dart';
import '../models/worker_model.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore firestore;

  UserRepositoryImpl(this.firestore);

  @override
  Future<User?> getUser(String userId) async {
    final doc = await firestore.collection('users').doc(userId).get();
    if (doc.exists) {
      final data = doc.data()!;
      if (data['role'] == 'worker') {
        return Worker(
          id: doc.id,
          name: data['name'],
          email: data['email'],
          phoneNumber: data['phoneNumber'],
          registrationDate: (data['registrationDate'] as Timestamp).toDate(),
          category: data['category'],
          rating: data['rating'],
          completedJobs: data['completedJobs'],
        );
      } else if (data['role'] == 'company') {
        // Fetch company employees as well
        final employeeDocs = await firestore.collection('users').doc(userId).collection('employees').get();
        final employees = employeeDocs.docs.map((doc) {
          final workerData = doc.data();
          return Worker(
            id: doc.id,
            name: workerData['name'],
            email: workerData['email'],
            phoneNumber: workerData['phoneNumber'],
            registrationDate: (workerData['registrationDate'] as Timestamp).toDate(),
            category: workerData['category'],
            rating: workerData['rating'],
            completedJobs: workerData['completedJobs'],
          );
        }).toList();

        return Company(
          id: doc.id,
          name: data['name'],
          email: data['email'],
          phoneNumber: data['phoneNumber'],
          registrationDate: (data['registrationDate'] as Timestamp).toDate(),
          businessName: data['businessName'],
          companyRegistrationNumber: data['companyRegistrationNumber'],
          employees: employees,
        );
      } else {
        return User(
          id: doc.id,
          name: data['name'],
          email: data['email'],
          phoneNumber: data['phoneNumber'],
          role: data['role'],
          registrationDate: (data['registrationDate'] as Timestamp).toDate(),
        );
      }
    }
    return null;
  }

  @override
  Future<void> updateUserRole(User user) async {
    await firestore.collection('users').doc(user.id).update({
      'role': user.role,
      if (user is Worker) 'category': user.category,
      if (user is Company) 'businessName': user.businessName,
    });
  }
}
