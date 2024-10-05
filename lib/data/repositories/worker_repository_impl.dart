import 'package:cloud_firestore/cloud_firestore.dart';
import 'worker_repository.dart';

import '../models/worker_model.dart';

class WorkerRepositoryImpl implements WorkerRepository {
  final FirebaseFirestore firestore;

  WorkerRepositoryImpl(this.firestore);

  @override
  Future<Worker?> getWorker(String workerId) async {
    final doc = await firestore.collection('users').doc(workerId).get();
    if (doc.exists && doc.data()!['role'] == 'worker') {
      final data = doc.data()!;
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
    }
    return null;
  }
}
