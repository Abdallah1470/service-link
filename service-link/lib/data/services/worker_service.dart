import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/worker_model.dart';
import '../repositories/rating_repository.dart';
import '../repositories/worker_provider.dart'; // Make sure to import your provider

class WorkerService {
  final RatingRepository ratingRepository;
  final Ref ref;

  WorkerService(this.ratingRepository, this.ref);

  // Function to update worker's rating and review count
  Future<WorkerModel> updateWorkerRating(WorkerModel worker) async {
    try {
      // Fetch updated rating and number of reviews
      double averageRating = await ratingRepository.getUpdatedRating(worker.id);
      int numberOfReviews = await ratingRepository.getNumberOfReviews(worker.id);

      // Return a new WorkerModel instance with updated rating and reviews count
      return worker.updateRating(
        averageRating: averageRating,
        numberOfReviews: numberOfReviews,
      );
    } catch (error) {
      // Handle error (e.g., log it, show a message, etc.)
      throw Exception('Error updating worker rating: $error');
    }
  }

  // Function to add or update a rating for a worker
  Future<void> addOrUpdateRating({
    required WorkerModel worker,
    required String raterId,
    required double ratingValue,
    required String review,
  }) async {
    try {
      // Add or update the rating for the worker
      await ratingRepository.rateWorker(
        worker.id,
        raterId,
        ratingValue,
        review,
      );

      // Update the worker's rating after adding/updating
      WorkerModel updatedWorker = await updateWorkerRating(worker);

      // Now that we have the updated worker with the new rating and review count
      // You can update the worker in Firestore or in your state management solution
      await updateWorkerInFirestore(updatedWorker);

      // Update the worker in Riverpod state
      ref.read(workerProvider.notifier).setWorker(updatedWorker);

    } catch (error) {
      // Handle error (e.g., log it, show a message, etc.)
      throw Exception('Error adding or updating rating: $error');
    }
  }

  // Function to update the worker's data in Firestore after rating update
  Future<void> updateWorkerInFirestore(WorkerModel updatedWorker) async {
    try {
      // Manually map the fields instead of using toJson
      Map<String, dynamic> workerData = {
        'id': updatedWorker.id,
        'name': updatedWorker.name,
        'averageRating': updatedWorker.averageRating,
        'numberOfReviews': updatedWorker.numberOfReviews,
        'completedOrders': updatedWorker.completedOrders,
        'skills': updatedWorker.skills,
        'yearsOfExperience': updatedWorker.yearsOfExperience,
        'workingAreas': updatedWorker.workingAreas,
        'city': updatedWorker.city,
        'dateOfBirth': updatedWorker.dateOfBirth,
        'profileImageUrl': updatedWorker.profileImageUrl,
        'registrationDate': updatedWorker.registrationDate,
        'fcmToken': updatedWorker.fcmToken,
        'notificationsHistory': updatedWorker.notificationsHistory,
        'ordersHistory': updatedWorker.ordersHistory,
        'promotionsHistory': updatedWorker.promotionsHistory,

      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(updatedWorker.id)
          .update(workerData);
    } catch (error) {
      // Handle Firestore update error
      throw Exception('Error updating worker in Firestore: $error');
    }
  }
}
