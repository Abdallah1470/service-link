import 'user_model.dart';
import 'worker_model.dart';

class Company extends User {
  final String businessName;
  final String companyRegistrationNumber;
  final List<Worker> employees;

  const Company({
    required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.registrationDate,
    required this.businessName,
    required this.companyRegistrationNumber,
    this.employees = const [],
  }) : super(role: 'company');

  // CopyWith method specific for Company
  Company copyWithCompany({
    String? businessName,
    String? companyRegistrationNumber,
    List<Worker>? employees,
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    DateTime? registrationDate,
  }) {
    return Company(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      registrationDate: registrationDate ?? this.registrationDate,
      businessName: businessName ?? this.businessName,
      companyRegistrationNumber: companyRegistrationNumber ?? this.companyRegistrationNumber,
      employees: employees ?? this.employees,
    );
  }
}
