// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      id: json['_id'] as String?,
      name: json['name'] as String,
      image: json['image'] as String?,
      phone: json['phone'] as String,
      username: json['username'] as String,
      password: json['password'] as String?,
      email: json['email'] as String,
      address: json['address'] as String,
      dob: json['dob'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'phone': instance.phone,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'address': instance.address,
      'dob': instance.dob,
      'gender': instance.gender,
    };
