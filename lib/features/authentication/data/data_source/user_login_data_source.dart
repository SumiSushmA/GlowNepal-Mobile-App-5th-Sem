import '../../domain/entity/user_login_entity.dart';

abstract class IUserLoginDataSource {
  Future<void> createUser(UserLoginEntity userEntity);
  Future<void> deleteUser(String email);
  Future<UserLoginEntity?> login(String email, String password);
  Future<List<UserLoginEntity>> getAllUsers();
}
