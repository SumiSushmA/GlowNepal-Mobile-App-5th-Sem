// import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/repository/user_login_data_repository.dart';

// import '../entity/user_login_entity.dart';

// /// Abstract class for User Login Domain Repository
// abstract class UserLoginDomainRepository {
//   Future<void> saveUser(String email, String password);
//   Future<UserLoginEntity?> loginUser(String email, String password);
//   Future<void> deleteUser(String email);
//   Future<List<UserLoginEntity>> getAllUsers();
// }

// /// Implementation of User Login Domain Repository
// class UserLoginDomainRepositoryImpl implements UserLoginDomainRepository {
//   final UserLoginDataRepository dataRepository;

//   UserLoginDomainRepositoryImpl(this.dataRepository);

//   @override
//   Future<void> saveUser(String email, String password) async {
//     final userEntity = UserLoginEntity(email: email, password: password);
//     await dataRepository.createUser(userEntity);
//   }

//   @override
//   Future<UserLoginEntity?> loginUser(String email, String password) async {
//     return await dataRepository.loginUser(email, password);
//   }

//   @override
//   Future<void> deleteUser(String email) async {
//     await dataRepository.deleteUser(email);
//   }

//   @override
//   Future<List<UserLoginEntity>> getAllUsers() async {
//     return await dataRepository.getAllUsers();
//   }
// }

import '../entity/user_login_entity.dart';

abstract class UserLoginDomainRepository {
  Future<void> createUser(UserLoginEntity userEntity);
  Future<UserLoginEntity?> loginUser(String email, String password);
  Future<void> deleteUser(String email);
  Future<List<UserLoginEntity>> getAllUsers();
}
