import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_signup_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_signup_hive_model.g.dart';

@HiveType(typeId: 1)
class UserSignupHiveModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final String profileImagePath;

  @HiveField(4)
  final String phone;

  @HiveField(5)
  final String gender;

  UserSignupHiveModel({
    required this.name,
    required this.email,
    required this.password,
    required this.profileImagePath,
    required this.phone,
    required this.gender,
  });

  factory UserSignupHiveModel.fromEntity(UserSignupEntity entity) {
    return UserSignupHiveModel(
      name: entity.name,
      email: entity.email,
      password: entity.password,
      profileImagePath: entity.profileImagePath,
      phone: entity.phone,
      gender: entity.gender,
    );
  }

  UserSignupEntity toEntity() {
    return UserSignupEntity(
      name: name,
      email: email,
      password: password,
      profileImagePath: profileImagePath,
      phone: phone,
      gender: gender,
    );
  }
}
