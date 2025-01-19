import '../entity/user_login_entity.dart';

abstract class UserLoginDomainRepository {
  Future<void> createUser(UserLoginEntity userEntity);
  Future<UserLoginEntity?> loginUser(String email, String password);
  Future<void> deleteUser(String email);
  Future<List<UserLoginEntity>> getAllUsers();
}
