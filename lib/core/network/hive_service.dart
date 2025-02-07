import 'package:glownepal_mobile_app_5th_sem/app/constants/hive_table_constant.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/data/model/auth_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  Future<void> init() async {
    //Initialize the Database
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}.glow_nepal.db';

    //Create Database
    Hive.init(path);

    //Register Adapters

    Hive.registerAdapter(AuthHiveModelAdapter());
  }

// User Queries

  Future<void> addUser(AuthHiveModel user) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(user.studentId, user);
  }

  Future<void> deleteUser(String id) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.delete(id);
  }

  Future<List<AuthHiveModel>> getAllUsers() async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var users = box.values.toList();
    return users;
  }

  Future<AuthHiveModel?> loginUser(String email, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);

    var auth = box.values.firstWhere(
        (element) => element.email == email && element.password == password,
        orElse: () => AuthHiveModel.initial());

    return auth;
  }
}
