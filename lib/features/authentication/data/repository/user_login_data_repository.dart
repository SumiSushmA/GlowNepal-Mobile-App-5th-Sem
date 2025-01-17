// import '../../domain/entity/user_login_entity.dart';
// import '../data_source/user_login_data_source.dart';

// /// Abstract class for User Login Data Repository
// abstract class UserLoginDataRepository {
//   Future<void> createUser(UserLoginEntity userEntity);
//   Future<UserLoginEntity?> loginUser(String email, String password);
//   Future<void> deleteUser(String email);
//   Future<List<UserLoginEntity>> getAllUsers();
// }

// /// Implementation of the User Login Data Repository
// class UserLoginDataRepositoryImpl implements UserLoginDataRepository {
//   final IUserLoginDataSource dataSource;

//   UserLoginDataRepositoryImpl(this.dataSource);

//   @override
//   Future<void> createUser(UserLoginEntity userEntity) async {
//     try {
//       await dataSource.createUser(userEntity);
//     } catch (e) {
//       throw Exception('Error creating user: $e');
//     }
//   }

//   @override
//   Future<UserLoginEntity?> loginUser(String email, String password) async {
//     try {
//       return await dataSource.login(email, password);
//     } catch (e) {
//       throw Exception('Error logging in: $e');
//     }
//   }

//   @override
//   Future<void> deleteUser(String email) async {
//     try {
//       await dataSource.deleteUser(email);
//     } catch (e) {
//       throw Exception('Error deleting user: $e');
//     }
//   }

//   @override
//   Future<List<UserLoginEntity>> getAllUsers() async {
//     try {
//       return await dataSource.getAllUsers();
//     } catch (e) {
//       throw Exception('Error retrieving users: $e');
//     }
//   }
// }

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
