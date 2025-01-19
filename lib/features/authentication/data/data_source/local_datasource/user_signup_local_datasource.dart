import 'package:glownepal_mobile_app_5th_sem/core/network/hive_service.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/data_source/user_signup_data_source.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/model/user_signup_hive_model.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_signup_entity.dart';

class UserSignupLocalDatasource implements IUserSignupDataSource {
  final HiveService hiveService;

  UserSignupLocalDatasource(this.hiveService);

  @override
  Future<void> createUser(UserSignupEntity userEntity) async {
    try {
      final userHiveModel = UserSignupHiveModel.fromEntity(userEntity);
      await hiveService.addSignupUser(userHiveModel);
    } catch (e) {
      throw Exception('Error creating user: $e');
    }
  }

  @override
  Future<UserSignupEntity?> getUserByEmail(String email) async {
    try {
      final userHiveModel = await hiveService.getSignupUser(email);
      return userHiveModel?.toEntity();
    } catch (e) {
      throw Exception('Error retrieving user: $e');
    }
  }

  @override
  Future<bool> isEmailRegistered(String email) async {
    try {
      return await hiveService.isEmailRegistered(email);
    } catch (e) {
      throw Exception('Error checking email registration: $e');
    }
  }

  @override
  Future<void> deleteUser(String email) async {
    try {
      await hiveService.deleteSignupUser(email);
    } catch (e) {
      throw Exception('Error deleting user: $e');
    }
  }
}
