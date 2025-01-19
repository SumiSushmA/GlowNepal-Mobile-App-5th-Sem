import 'package:glownepal_mobile_app_5th_sem/core/network/hive_service.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/data_source/user_login_data_source.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/model/user_login_hive_model.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_login_entity.dart';

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
