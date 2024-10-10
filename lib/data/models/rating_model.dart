import 'package:cloud_firestore/cloud_firestore.dart';

enum RatingStatus { pending, approved, rejected }

class RatingModel {
  final String ratingId;
  final String workerId;
  final String raterId;
  final double ratingValue;
  final String review;
  final DateTime timestamp;
  final RatingStatus status;

  RatingModel({
    required this.ratingId,
    required this.workerId,
    required this.raterId,
    required this.ratingValue,
    required this.review,
    required this.timestamp,
    this.status = RatingStatus.approved, // Default to approved
  });

  // Convert RatingModel to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'ratingId': ratingId,
      'workerId': workerId,
      'raterId': raterId,
      'ratingValue': ratingValue,
      'review': review,
      'timestamp': Timestamp.fromDate(timestamp),
      'status': status.toString().split('.').last,
    };
  }

  // Create RatingModel from Firestore document
  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      ratingId: json['ratingId'],
      workerId: json['workerId'],
      raterId: json['raterId'],
      ratingValue: (json['ratingValue'] as num).toDouble(),
      review: json['review'],
      timestamp: (json['timestamp'] as Timestamp).toDate(),
      status: RatingStatus.values.firstWhere(
              (e) => e.toString().split('.').last == json['status'],
          orElse: () => RatingStatus.approved),
    );
  }
}
