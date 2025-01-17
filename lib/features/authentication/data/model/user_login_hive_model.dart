import 'package:hive/hive.dart';

import '../../domain/entity/user_login_entity.dart';

part 'user_login_hive_model.g.dart';

@HiveType(typeId: 1)
class UserLoginHiveModel {
  @HiveField(0)
  final String email;

  @HiveField(1)
  final String password;

  UserLoginHiveModel({
    required this.email,
    required this.password,
  });

  // Convert from domain entity to Hive model
  factory UserLoginHiveModel.fromEntity(UserLoginEntity entity) {
    return UserLoginHiveModel(
      email: entity.email,
      password: entity.password,
    );
  }

  // Convert from Hive model to domain entity
  UserLoginEntity toEntity() {
    return UserLoginEntity(
      email: email,
      password: password,
    );
  }
}
