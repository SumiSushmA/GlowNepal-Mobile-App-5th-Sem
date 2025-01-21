import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/model/user_login_hive_model.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/model/user_signup_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  final Box<UserLoginHiveModel> userLoginBox;
  final Box<UserSignupHiveModel> userSignupBox;

  HiveService({
    required this.userLoginBox,
    required this.userSignupBox,
  });

  // For Login Users
  Future<void> addLoginUser(UserLoginHiveModel user) async {
    await userLoginBox.put(user.email, user);
  }

  Future<void> deleteLoginUser(String email) async {
    await userLoginBox.delete(email);
  }

  Future<UserLoginHiveModel?> loginUser(String email, String password) async {
    final user = userLoginBox.get(email);
    if (user != null && user.password == password) {
      return user;
    }
    return null;
  }

  Future<List<UserLoginHiveModel>> getAllLoginUsers() async {
    return userLoginBox.values.toList();
  }

  // For Signup Users
  Future<void> addSignupUser(UserSignupHiveModel user) async {
    await userSignupBox.put(user.email, user);
  }

  Future<UserSignupHiveModel?> getSignupUser(String email) async {
    return userSignupBox.get(email);
  }

  Future<void> deleteSignupUser(String email) async {
    await userSignupBox.delete(email);
  }

  Future<List<UserSignupHiveModel>> getAllSignupUsers() async {
    return userSignupBox.values.toList();
  }

  Future<bool> isEmailRegistered(String email) async {
    return userSignupBox.containsKey(email);
  }
}
