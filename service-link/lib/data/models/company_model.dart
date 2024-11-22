import 'user_model.dart';
import 'worker_model.dart';

class CompanyModel extends UserModel {
  final UserModel user;
  final String businessName;
  final String companyRegistrationNumber;
  final List<WorkerModel> employees;

  CompanyModel({
    required this.user, // Use UserModel as parameter
    required this.businessName,
    required this.companyRegistrationNumber,
    this.employees = const [],
  }) : super(
          id: user.id,
          name: user.name,
          email: user.email,
          phoneNumber: user.phoneNumber,
          role: UserRole.company,
          city: user.city,
          dateOfBirth: user.dateOfBirth,
          profileImageUrl: user.profileImageUrl,
          registrationDate: user.registrationDate,
          fcmToken: user.fcmToken,
          notificationsHistory: user.notificationsHistory,
          ordersHistory: user.ordersHistory,
          promotionsHistory: user.promotionsHistory,
        );

  // CopyWith method specific for Company
  CompanyModel copyWithCompany({
    String? businessName,
    String? companyRegistrationNumber,
    List<WorkerModel>? employees,
    UserModel? user, // Optional to take a user object
  }) {
    return CompanyModel(
      user: user ?? this,
      businessName: businessName ?? this.businessName,
      companyRegistrationNumber: companyRegistrationNumber ?? this.companyRegistrationNumber,
      employees: employees ?? this.employees,
    );
  }

  // Convert CompanyModel instance to JSON
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fcmToken': fcmToken,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'role': role.toString().split('.').last,
      'city': city,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'profileImageUrl': profileImageUrl,
      'registrationDate': registrationDate.toIso8601String(),
      'businessName': businessName,
      'companyRegistrationNumber': companyRegistrationNumber,
      'employees': employees.map((worker) => worker.toJson()).toList(),
    };
  }

  // Create CompanyModel instance from JSON
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      user: UserModel.fromJson(json), // Create UserModel from JSON
      businessName: json['businessName'],
      companyRegistrationNumber: json['companyRegistrationNumber'],
      employees: (json['employees'] as List)
          .map((workerJson) => WorkerModel.fromJson(workerJson))
          .toList(),
    );
  }
}