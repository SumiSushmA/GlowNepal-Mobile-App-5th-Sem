import 'package:hive/hive.dart';

import '../../domain/entity/user_signup_entity.dart';

part 'user_signup_hive_model.g.dart';

@HiveType(typeId: 2)
class UserSignupHiveModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final String profileImagePath;

  UserSignupHiveModel({
    required this.name,
    required this.email,
    required this.password,
    required this.profileImagePath,
  });

  factory UserSignupHiveModel.fromEntity(UserSignupEntity entity) {
    return UserSignupHiveModel(
      name: entity.name,
      email: entity.email,
      password: entity.password,
      profileImagePath: entity.profileImagePath,
    );
  }

  UserSignupEntity toEntity() {
    return UserSignupEntity(
      name: name,
      email: email,
      password: password,
      profileImagePath: profileImagePath,
    );
  }
}
