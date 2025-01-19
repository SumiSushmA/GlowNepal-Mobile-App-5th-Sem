import '../entity/user_signup_entity.dart';

abstract class UserSignupDomainRepository {
  Future<void> createUser(UserSignupEntity userEntity);
  Future<UserSignupEntity?> getUserByEmail(String email);
  Future<bool> isEmailRegistered(String email);
  Future<void> deleteUser(String email);
}
