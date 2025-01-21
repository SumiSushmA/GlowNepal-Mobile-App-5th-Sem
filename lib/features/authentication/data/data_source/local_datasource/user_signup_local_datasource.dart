import 'package:glownepal_mobile_app_5th_sem/core/network/hive_service.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/data_source/user_signup_data_source.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/model/user_signup_hive_model.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_signup_entity.dart';

class UserSignupLocalDatasource implements IUserSignupDataSource {
  final HiveService hiveService;

  UserSignupLocalDatasource(this.hiveService);

  @override
  Future<void> createUser(UserSignupEntity userEntity) async {
    final userHiveModel = UserSignupHiveModel.fromEntity(userEntity);
    await hiveService.addSignupUser(userHiveModel);
  }

  @override
  Future<UserSignupEntity?> getUserByEmail(String email) async {
    final userHiveModel = await hiveService.getSignupUser(email);
    return userHiveModel?.toEntity();
  }

  @override
  Future<bool> isEmailRegistered(String email) async {
    return await hiveService.isEmailRegistered(email);
  }

  @override
  Future<void> deleteUser(String email) async {
    await hiveService.deleteSignupUser(email);
  }
}
