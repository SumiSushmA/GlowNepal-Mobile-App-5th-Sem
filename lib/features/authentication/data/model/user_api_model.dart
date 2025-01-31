import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/user_login_entity.dart';
import '../../domain/entity/user_signup_entity.dart';

@JsonSerializable()
class UserApiModel extends Equatable {
  final String? userId;
  final String name;
  final String email;
  final String? profileImagePath;
  final String phone;
  final String gender;

  const UserApiModel({
    this.userId,
    required this.name,
    required this.email,
    this.profileImagePath,
    required this.phone,
    required this.gender,
  });

  const UserApiModel.empty()
      : userId = '',
        name = '',
        email = '',
        profileImagePath = '',
        phone = '',
        gender = '';

  // From JSON
  factory UserApiModel.fromJson(Map<String, dynamic> json) {
    return UserApiModel(
      userId: json['_id'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
      profileImagePath: json['profileImagePath'] as String?,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': userId,
      'name': name,
      'email': email,
      'profileImagePath': profileImagePath,
      'phone': phone,
      'gender': gender,
    };
  }

  // Convert API Object to Entity (Login)
  UserLoginEntity toLoginEntity() => UserLoginEntity(
        email: email,
        password: '', // Password not stored in API model
      );

  // Convert API Object to Entity (Signup)
  UserSignupEntity toSignupEntity() => UserSignupEntity(
        name: name,
        email: email,
        password: '', // Password not stored in API model
        profileImagePath: profileImagePath ?? '',
        phone: phone,
        gender: gender,
      );

  // Convert Entity to API Object (Signup)
  factory UserApiModel.fromSignupEntity(UserSignupEntity entity) {
    return UserApiModel(
      userId: null,
      name: entity.name,
      email: entity.email,
      profileImagePath: entity.profileImagePath,
      phone: entity.phone,
      gender: entity.gender,
    );
  }

  // Convert API List to Entity List
  static List<UserSignupEntity> toEntityList(List<UserApiModel> models) {
    return models.map((model) => model.toSignupEntity()).toList();
  }

  @override
  List<Object?> get props =>
      [userId, name, email, profileImagePath, phone, gender];
}
