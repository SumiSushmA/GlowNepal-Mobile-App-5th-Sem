import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/data_source/remote_datasource/user_remote_datasource.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_login_entity.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_signup_entity.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/repository/user_login_domain_repository.dart';

class UserLoginRemoteRepository implements UserLoginDomainRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserLoginRemoteRepository(this.userRemoteDataSource);

  @override
  Future<void> createUser(UserLoginEntity userEntity) async {
    await userRemoteDataSource.createUser(
      UserSignupEntity(
        name: '',
        email: userEntity.email,
        password: userEntity.password,
        profileImagePath: '',
        phone: '',
        gender: '',
      ),
    );
  }

  @override
  Future<UserLoginEntity?> loginUser(String email, String password) async {
    await userRemoteDataSource.login(email, password);
    return UserLoginEntity(email: email, password: password);
  }

  @override
  Future<void> deleteUser(String email) async {
    await userRemoteDataSource.deleteUser(email);
  }

  @override
  Future<List<UserLoginEntity>> getAllUsers() async {
    return [];
  }
}
