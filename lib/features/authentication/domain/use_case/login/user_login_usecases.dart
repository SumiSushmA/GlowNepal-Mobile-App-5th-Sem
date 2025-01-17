// import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_login_entity.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/repository/user_login_domain_repository.dart';

// /// Use case for saving a user
// class SaveUserUseCase {
//   final UserLoginDomainRepository repository;

//   SaveUserUseCase(this.repository);

//   Future<void> call(String email, String password) async {
//     final userEntity = UserLoginEntity(email: email, password: password);
//     await repository.saveUser(email, password);
//   }
// }

// /// Use case for logging in a user
// class LoginUserUseCase {
//   final UserLoginDomainRepository repository;

//   LoginUserUseCase(this.repository);

//   Future<UserLoginEntity?> call(String email, String password) async {
//     return await repository.loginUser(email, password);
//   }
// }

// /// Use case for deleting a user
// class DeleteUserUseCase {
//   final UserLoginDomainRepository repository;

//   DeleteUserUseCase(this.repository);

//   Future<void> call(String email) async {
//     await repository.deleteUser(email);
//   }
// }

// /// Use case for retrieving all users
// class GetAllUsersUseCase {
//   final UserLoginDomainRepository repository;

//   GetAllUsersUseCase(this.repository);

//   Future<List<UserLoginEntity>> call() async {
//     return await repository.getAllUsers();
//   }
// }

import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_login_entity.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/repository/user_login_domain_repository.dart';

/// Use case for saving a user
class SaveUserUseCase {
  final UserLoginDomainRepository repository;

  SaveUserUseCase(this.repository);

  Future<void> call(String email, String password) async {
    final userEntity = UserLoginEntity(email: email, password: password);
    await repository.createUser(userEntity);
  }
}

/// Use case for logging in a user
class LoginUserUseCase {
  final UserLoginDomainRepository repository;

  LoginUserUseCase(this.repository);

  Future<UserLoginEntity?> call(String email, String password) async {
    return await repository.loginUser(email, password);
  }
}

/// Use case for deleting a user
class DeleteUserUseCase {
  final UserLoginDomainRepository repository;

  DeleteUserUseCase(this.repository);

  Future<void> call(String email) async {
    await repository.deleteUser(email);
  }
}

/// Use case for retrieving all users
class GetAllUsersUseCase {
  final UserLoginDomainRepository repository;

  GetAllUsersUseCase(this.repository);

  Future<List<UserLoginEntity>> call() async {
    return await repository.getAllUsers();
  }
}
