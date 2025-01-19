import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_signup_entity.dart';

abstract class IUserSignupDataSource {
  Future<void> createUser(UserSignupEntity userEntity);
  Future<UserSignupEntity?> getUserByEmail(String email);
  Future<bool> isEmailRegistered(String email);
  Future<void> deleteUser(String email);
}
