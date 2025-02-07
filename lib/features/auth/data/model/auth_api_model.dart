import 'package:equatable/equatable.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String name; // ✅ Use full name instead of fName & lName
  final String? image;
  final String phone;
  final String email;
  final String username;
  final String? password;
  final String address;
  final String dob;
  final String gender;

  const AuthApiModel({
    this.id,
    required this.name, // ✅ Use single `name` field
    required this.image,
    required this.phone,
    required this.username,
    required this.password,
    required this.email,
    required this.address,
    required this.dob,
    required this.gender,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // ✅ Convert API Model to Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: id,
      name: name, // ✅ Using full name directly
      image: image,
      phone: phone,
      username: username,
      password: password ?? '',
      email: email,
      address: address,
      dob: dob,
      gender: gender,
    );
  }

  // ✅ Convert Entity to API Model
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      name: entity.name, // ✅ Use full name
      image: entity.image,
      phone: entity.phone,
      username: entity.username,
      password: entity.password,
      email: entity.email,
      address: entity.address,
      dob: entity.dob,
      gender: entity.gender,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, image, phone, username, password, email, address, dob, gender];
}
