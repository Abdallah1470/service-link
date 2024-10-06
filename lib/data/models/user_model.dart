class User {
  final String id;
  // fcmToken
  final String? fcmToken;
  final String name;
  final String email;
  final String phoneNumber;
  final String role; // Could be 'user', 'worker', or 'company'
  final DateTime registrationDate;

  const User({
    required this.id,
    required this.name,
    this.fcmToken,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.registrationDate,
  });

  // CopyWith method for User
  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    DateTime? registrationDate,
    String? role,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      registrationDate: registrationDate ?? this.registrationDate,
      role: role ?? this.role,
    );
  }
}
