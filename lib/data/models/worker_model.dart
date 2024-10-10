import 'user_model.dart';
import 'order_model.dart';
import 'notification_model.dart';
import 'promotion_model.dart';

class WorkerModel extends UserModel {
  final String category;
  final double averageRating;
  final int numberOfReviews;
  final List<OrderModel> completedOrders;
  final List<String> skills; // Additional field
  final int yearsOfExperience; // Additional field
  final String description; // Additional field
  final List<String> workingAreas; // Additional field

  final UserModel user;

  // Constructor takes a UserModel to promote a user to a worker
  WorkerModel({
    required this.user,
    required this.category,
    this.description = '',
    this.averageRating = 0.0,
    this.numberOfReviews = 0,
    this.completedOrders = const [],
    this.skills = const [],
    this.yearsOfExperience = 0,
    this.workingAreas = const [],
  }) : super(
          id: user.id,
          name: user.name,
          email: user.email,
          phoneNumber: user.phoneNumber,
          role: UserRole.worker,
          city: user.city,
          dateOfBirth: user.dateOfBirth,
          profileImageUrl: user.profileImageUrl,
          registrationDate: user.registrationDate,
          fcmToken: user.fcmToken,
          notificationsHistory: (user.notificationsHistory as List)
              .map((item) => NotificationModel.fromJson(item))
              .toList(),
          ordersHistory: (user.ordersHistory as List)
              .map((item) => OrderModel.fromJson(item))
              .toList(),
          promotionsHistory: (user.promotionsHistory as List)
              .map((item) => PromotionModel.fromJson(item))
              .toList(),
        );

  // Method to update rating and reviews count
  WorkerModel updateRating({
    required double averageRating,
    required int numberOfReviews,
  }) {
    return WorkerModel(
      user: this,
      category: this.category,
      averageRating: averageRating,
      numberOfReviews: numberOfReviews,
      completedOrders: this.completedOrders,
      skills: this.skills,
      yearsOfExperience: this.yearsOfExperience,
      workingAreas: this.workingAreas,
    );
  }

  // CopyWith method specific for WorkerModel
  WorkerModel copyWithWorker({
    String? category,
    double? averageRating,
    int? numberOfReviews,
    List<OrderModel>? completedOrders,
    List<String>? skills,
    int? yearsOfExperience,
    List<String>? workingAreas,
    UserModel? user, // Optional to take a user object
  }) {
    return WorkerModel(
      user: user ?? this,
      category: category ?? this.category,
      averageRating: averageRating ?? this.averageRating,
      numberOfReviews: numberOfReviews ?? this.numberOfReviews,
      completedOrders: completedOrders ?? this.completedOrders,
      skills: skills ?? this.skills,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      workingAreas: workingAreas ?? this.workingAreas,
    );
  }

  // Convert WorkerModel instance to JSON
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'description': description,
      'role': UserRole.worker.name, // Assuming role is an enum, use .name to get string value
      'city': city,
      'dateOfBirth': dateOfBirth/*.toIso8601String()*/,
      'profileImageUrl': profileImageUrl,
      'registrationDate': registrationDate/*.toIso8601String()*/,
      'fcmToken': fcmToken,
      'notificationsHistory': notificationsHistory.map((item) => item.toJson()).toList(),
      'ordersHistory': ordersHistory.map((item) => item.toJson()).toList(),
      'promotionsHistory': promotionsHistory.map((item) => item.toJson()).toList(),
      'category': category,
      'averageRating': averageRating,
      'numberOfReviews': numberOfReviews,
      'completedOrders': completedOrders.map((order) => order.toJson()).toList(),
      'skills': skills,
      'yearsOfExperience': yearsOfExperience,
      'workingAreas': workingAreas,
    };
  }

  // Create WorkerModel instance from JSON
  factory WorkerModel.fromJson(Map<String, dynamic> json) {
    return WorkerModel(
      user: UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        role: UserRole.values.firstWhere((e) => e.name == json['role']),
        city: json['city'],
        dateOfBirth: DateTime.parse(json['dateOfBirth']),
        profileImageUrl: json['profileImageUrl'],
        registrationDate: DateTime.parse(json['registrationDate']),
        fcmToken: json['fcmToken'],
        notificationsHistory: (json['notificationsHistory'] as List)
            .map((item) => NotificationModel.fromJson(item))
            .toList(),
        ordersHistory: (json['ordersHistory'] as List)
            .map((item) => OrderModel.fromJson(item))
            .toList(),
        promotionsHistory: (json['promotionsHistory'] as List)
            .map((item) => PromotionModel.fromJson(item))
            .toList(),
      ),
      category: json['category'],
      description: json['description'],
      averageRating: (json['averageRating'] as num).toDouble(),
      numberOfReviews: json['numberOfReviews'],
      completedOrders: (json['completedOrders'] as List)
          .map((order) => OrderModel.fromJson(order))
          .toList(),
      skills: List<String>.from(json['skills']),
      yearsOfExperience: json['yearsOfExperience'],
      workingAreas: List<String>.from(json['workingAreas']),
    );
  }
}