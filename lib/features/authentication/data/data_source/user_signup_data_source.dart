import '../../domain/entity/user_signup_entity.dart';

abstract class IUserSignupDataSource {
  Future<void> createUser(UserSignupEntity userEntity);
}
