// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDTO _$LoginDTOFromJson(Map<String, dynamic> json) => LoginDTO(
      success: json['success'] as bool,
      token: json['token'] as String,
      email: json['email'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$LoginDTOToJson(LoginDTO instance) => <String, dynamic>{
      'success': instance.success,
      'token': instance.token,
      'email': instance.email,
      'userId': instance.userId,
    };
