import 'user_model.dart';

class Worker extends User {
  final String category;
  final double rating;
  final int completedJobs;

  const Worker({
    required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.registrationDate,
    required this.category,
    this.rating = 0.0,
    this.completedJobs = 0,
  }) : super(role: 'worker');

  // CopyWith method specific for Worker
  Worker copyWithWorker({
    String? category,
    double? rating,
    int? completedJobs,
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    DateTime? registrationDate,
  }) {
    return Worker(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      registrationDate: registrationDate ?? this.registrationDate,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      completedJobs: completedJobs ?? this.completedJobs,
    );
  }
}
