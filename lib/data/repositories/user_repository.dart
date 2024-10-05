import '../models/user_model.dart';

abstract class UserRepository {
  Future<User?> getUser(String userId);
  Future<void> updateUserRole(User user);
}