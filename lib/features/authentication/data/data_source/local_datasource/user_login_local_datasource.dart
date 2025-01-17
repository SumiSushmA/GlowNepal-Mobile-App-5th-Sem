// import 'package:glownepal_mobile_app_5th_sem/core/network/hive_service.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/data_source/user_login_data_source.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/model/user_login_hive_model.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_login_entity.dart';

// class UserLoginLocalDatasource implements IUserLoginDataSource {
//   final HiveService hiveService;

//   UserLoginLocalDatasource(this.hiveService);

//   @override
//   Future<void> createUser(UserLoginEntity userEntity) async {
//     try {
//       // Convert the domain entity to the Hive model
//       final userHiveModel = UserLoginHiveModel.fromEntity(userEntity);
//       await hiveService.addLoginUser(userHiveModel);
//     } catch (e) {
//       throw Exception('Error creating user: $e');
//     }
//   }

//   @override
//   Future<void> deleteUser(String email) async {
//     try {
//       await hiveService.deleteLoginUser(email);
//     } catch (e) {
//       throw Exception('Error deleting user: $e');
//     }
//   }

//   @override
//   Future<UserLoginEntity?> login(String email, String password) async {
//     try {
//       final userHiveModel = await hiveService.loginUser(email, password);
//       if (userHiveModel != null) {
//         // Convert Hive model to domain entity
//         return userHiveModel.toEntity();
//       }
//       return null;
//     } catch (e) {
//       throw Exception('Error logging in: $e');
//     }
//   }

//   @override
//   Future<List<UserLoginEntity>> getAllUsers() async {
//     try {
//       final userHiveModels = await hiveService.getAllLoginUsers();
//       // Convert Hive models to domain entities
//       return userHiveModels
//           .map((userHiveModel) => userHiveModel.toEntity())
//           .toList();
//     } catch (e) {
//       throw Exception('Error retrieving users: $e');
//     }
//   }
// }

import 'package:glownepal_mobile_app_5th_sem/core/network/hive_service.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/model/user_login_hive_model.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_login_entity.dart';

abstract class IUserLoginDataSource {
  Future<void> createUser(UserLoginEntity userEntity);
  Future<UserLoginEntity?> login(String email, String password);
  Future<void> deleteUser(String email);
  Future<List<UserLoginEntity>> getAllUsers();
}

class UserLoginLocalDatasource implements IUserLoginDataSource {
  final HiveService hiveService;

  UserLoginLocalDatasource(this.hiveService);

  @override
  Future<void> createUser(UserLoginEntity userEntity) async {
    final hiveModel = UserLoginHiveModel.fromEntity(userEntity);
    await hiveService.addLoginUser(hiveModel);
  }

  @override
  Future<UserLoginEntity?> login(String email, String password) async {
    final hiveModel = await hiveService.loginUser(email, password);
    return hiveModel?.toEntity();
  }

  @override
  Future<void> deleteUser(String email) async {
    await hiveService.deleteLoginUser(email);
  }

  @override
  Future<List<UserLoginEntity>> getAllUsers() async {
    final hiveModels = await hiveService.getAllLoginUsers();
    return hiveModels.map((model) => model.toEntity()).toList();
  }
}
