import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/data_source/user_signup_data_source.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_signup_entity.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/repository/user_signup_domain_repository.dart';

class UserSignupDataRepositoryImpl implements UserSignupDomainRepository {
  final IUserSignupDataSource dataSource;

  UserSignupDataRepositoryImpl(this.dataSource);

  @override
  Future<void> createUser(UserSignupEntity userEntity) async {
    await dataSource.createUser(userEntity);
  }

  @override
  Future<UserSignupEntity?> getUserByEmail(String email) async {
    return await dataSource.getUserByEmail(email);
  }

  @override
  Future<bool> isEmailRegistered(String email) async {
    return await dataSource.isEmailRegistered(email);
  }

  @override
  Future<void> deleteUser(String email) async {
    await dataSource.deleteUser(email);
  }
}
