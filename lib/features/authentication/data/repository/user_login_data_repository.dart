import '../../domain/entity/user_login_entity.dart';
import '../../domain/repository/user_login_domain_repository.dart';
import '../data_source/user_login_data_source.dart';

/// Implementation of the User Login Data Repository
class UserLoginDataRepositoryImpl implements UserLoginDomainRepository {
  final IUserLoginDataSource dataSource;

  UserLoginDataRepositoryImpl(this.dataSource);

  @override
  Future<void> createUser(UserLoginEntity userEntity) async {
    await dataSource.createUser(userEntity);
  }

  @override
  Future<UserLoginEntity?> loginUser(String email, String password) async {
    return await dataSource.login(email, password);
  }

  @override
  Future<void> deleteUser(String email) async {
    await dataSource.deleteUser(email);
  }

  @override
  Future<List<UserLoginEntity>> getAllUsers() async {
    return await dataSource.getAllUsers();
  }
}
