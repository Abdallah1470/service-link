import '../models/user_model.dart';

abstract class UserRepository {
  Future<UserModel?> getUser(String userId);
  Future<void> updateUserRole(UserModel user);
}