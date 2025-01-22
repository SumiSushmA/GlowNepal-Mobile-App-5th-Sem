// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_signup_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserSignupHiveModelAdapter extends TypeAdapter<UserSignupHiveModel> {
  @override
  final int typeId = 1;

  @override
  UserSignupHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserSignupHiveModel(
      name: fields[0] as String,
      email: fields[1] as String,
      password: fields[2] as String,
      profileImagePath: fields[3] as String,
      phone: fields[4] as String,
      gender: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserSignupHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.profileImagePath)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.gender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserSignupHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
