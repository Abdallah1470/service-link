import 'package:cloud_firestore/cloud_firestore.dart';

import 'rating_repository.dart';

class RatingRepositoryImpl implements RatingRepository {
  final FirebaseFirestore firestore;

  RatingRepositoryImpl(this.firestore);

  @override
  Future<void> rateWorker(String workerId, String raterId, double rating, String review) async {
    await firestore.collection('users').doc(workerId).collection('ratings').add({
      'raterId': raterId,
      'ratingValue': rating,
      'review': review,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<double> getUpdatedRating(String workerId) async {
    final ratingsSnapshot = await firestore.collection('users').doc(workerId).collection('ratings').get();
    double totalRating = 0.0;
    for (var doc in ratingsSnapshot.docs) {
      totalRating += doc.data()['ratingValue'];
    }
    return totalRating / ratingsSnapshot.size;
  }
}
