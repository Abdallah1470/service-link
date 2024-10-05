import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/company_model.dart';
import '../models/worker_model.dart';
import 'company_repository.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final FirebaseFirestore firestore;

  CompanyRepositoryImpl(this.firestore);

  @override
  Future<Company?> getCompany(String companyId) async {
    final doc = await firestore.collection('users').doc(companyId).get();
    if (doc.exists && doc.data()!['role'] == 'company') {
      final data = doc.data()!;
      final employeeDocs = await firestore.collection('users').doc(companyId).collection('employees').get();
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
    }
    return null;
  }

  @override
  Future<void> addWorker(String companyId, Worker worker) async {
    await firestore.collection('users').doc(companyId).collection('employees').add({
      'name': worker.name,
      'email': worker.email,
      'phoneNumber': worker.phoneNumber,
      'registrationDate': worker.registrationDate,
      'category': worker.category,
      'rating': worker.rating,
      'completedJobs': worker.completedJobs,
    });
  }
}
