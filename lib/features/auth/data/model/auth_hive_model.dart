import 'package:equatable/equatable.dart';
import 'package:glownepal_mobile_app_5th_sem/app/constants/hive_table_constant.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/entity/auth_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.studentTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? studentId;
  @HiveField(1)
  final String name; // ✅ Use full name instead of fName & lName
  @HiveField(2)
  final String? image;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final String email;
  @HiveField(5)
  final String gender;
  @HiveField(6)
  final String username;
  @HiveField(7)
  final String password;
  @HiveField(8)
  final String dob;
  @HiveField(9)
  final String address;

  AuthHiveModel({
    String? studentId,
    required this.name, // ✅ Use single `name` field
    this.image,
    required this.phone,
    required this.username,
    required this.password,
    required this.email,
    required this.address,
    required this.dob,
    required this.gender,
  }) : studentId = studentId ?? const Uuid().v4();

  // Initial Constructor
  const AuthHiveModel.initial()
      : studentId = '',
        name = '',
        image = '',
        phone = '',
        username = '',
        password = '',
        email = '',
        address = '',
        dob = '',
        gender = '';

  // ✅ From Entity
  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      studentId: entity.userId,
      name: entity.name, // ✅ Use full name directly
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

  // ✅ To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: studentId,
      name: name, // ✅ Using full name directly
      image: image,
      phone: phone,
      username: username,
      password: password,
      email: email,
      address: address,
      dob: dob,
      gender: gender,
    );
  }

  @override
  List<Object?> get props => [
        studentId,
        name, // ✅ Using full name
        image,
        username,
        password,
        email,
        address,
        dob,
        gender
      ];
}
