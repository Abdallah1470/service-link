import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/rating_model.dart';
import 'rating_repository.dart';

class RatingRepositoryImpl implements RatingRepository {
  final FirebaseFirestore firestore;

  RatingRepositoryImpl(this.firestore);

  @override
  Future<void> rateWorker(String workerId, String raterId, double rating, String review) async {
    String ratingId = '${workerId}_$raterId'; // Ensures uniqueness for the rating

    DocumentReference ratingDoc = firestore
        .collection('users')
        .doc(workerId)
        .collection('ratings')
        .doc(ratingId);

    // Check if the rating already exists
    DocumentSnapshot docSnapshot = await ratingDoc.get();
    if (docSnapshot.exists) {
      // Update existing rating
      await ratingDoc.update({
        'ratingValue': rating,
        'review': review,
        'timestamp': FieldValue.serverTimestamp(),
        'status': 'approved', // Update status appropriately
      });
    } else {
      // Create new rating
      RatingModel newRating = RatingModel(
        ratingId: ratingId,
        workerId: workerId,
        raterId: raterId,
        ratingValue: rating,
        review: review,
        timestamp: DateTime.now(),
      );

      await ratingDoc.set(newRating.toJson());
    }
  }

  @override
  Future<double> getUpdatedRating(String workerId) async {
    QuerySnapshot ratingsSnapshot = await firestore
        .collection('users')
        .doc(workerId)
        .collection('ratings')
        .where('status', isEqualTo: 'approved') // Only approved ratings
        .get();

    double totalRating = 0.0;
    int count = 0;

    for (var doc in ratingsSnapshot.docs) {
      totalRating += (doc['ratingValue'] as num).toDouble();
      count++;
    }

    if (count == 0) return 0.0;

    return totalRating / count;
  }

  @override
  Future<int> getNumberOfReviews(String workerId) async {
    QuerySnapshot ratingsSnapshot = await firestore
        .collection('users')
        .doc(workerId)
        .collection('ratings')
        .where('status', isEqualTo: 'approved') // Only approved ratings
        .get();

    return ratingsSnapshot.size;
  }
}
