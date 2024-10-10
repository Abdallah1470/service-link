import 'user_model.dart';
import 'order_model.dart';
import 'notification_model.dart';
import 'promotion_model.dart';

enum UserRole { user, worker, company }

class UserModel {
  final String id;
  final String? fcmToken;
  final String name;
  final String email;
  final String phoneNumber;
  final UserRole role;
  final String city;
  final DateTime dateOfBirth;
  final String profileImageUrl;
  final DateTime registrationDate;

  // History and related information
  final List<NotificationModel> notificationsHistory;
  final List<OrderModel> ordersHistory;
  final List<PromotionModel> promotionsHistory;

  const UserModel({
    required this.id,
    this.fcmToken,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.city,
    required this.dateOfBirth,
    required this.profileImageUrl,
    required this.registrationDate,
    this.notificationsHistory = const [],
    this.ordersHistory = const [],
    this.promotionsHistory = const [],
  });

  // CopyWith method for User
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    UserRole? role,
    String? city,
    String? fcmToken,
    DateTime? dateOfBirth,
    String? profileImageUrl,
    DateTime? registrationDate,
    List<NotificationModel>? notificationsHistory,
    List<OrderModel>? ordersHistory,
    List<PromotionModel>? promotionsHistory,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      role: role ?? this.role,
      city: city ?? this.city,
      fcmToken: fcmToken ?? this.fcmToken,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      registrationDate: registrationDate ?? this.registrationDate,
      notificationsHistory: notificationsHistory ?? this.notificationsHistory,
      ordersHistory: ordersHistory ?? this.ordersHistory,
      promotionsHistory: promotionsHistory ?? this.promotionsHistory,
    );
    }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fcmToken': fcmToken,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'role': role.toString().split('.').last,
      'city': city,
      'dateOfBirth': dateOfBirth/*.toIso8601String()*/,
      'profileImageUrl': profileImageUrl,
      'registrationDate': registrationDate/*.toIso8601String()*/,
      'notificationsHistory': notificationsHistory.map((notification) => notification.toJson()).toList(),
      'ordersHistory': ordersHistory.map((order) => order.toJson()).toList(),
      'promotionsHistory': promotionsHistory.map((promotion) => promotion.toJson()).toList(),
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fcmToken: json['fcmToken'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      role: UserRole.values.firstWhere(
        (e) => e.toString().split('.').last == json['role'],
        orElse: () => UserRole.user,
      ),
      city: json['city'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      profileImageUrl: json['profileImageUrl'],
      registrationDate: DateTime.parse(json['registrationDate']),
      notificationsHistory: (json['notificationsHistory'] as List)
          .map((notificationJson) => NotificationModel.fromJson(notificationJson))
          .toList(),
      ordersHistory: (json['ordersHistory'] as List)
          .map((orderJson) => OrderModel.fromJson(orderJson))
          .toList(),
      promotionsHistory: (json['promotionsHistory'] as List)
          .map((promotionJson) => PromotionModel.fromJson(promotionJson))
          .toList(),
    );
  }
}
