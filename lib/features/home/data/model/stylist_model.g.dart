// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stylist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StylistModelAdapter extends TypeAdapter<StylistModel> {
  @override
  final int typeId = 1;

  @override
  StylistModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StylistModel(
      id: fields[0] as String,
      name: fields[1] as String,
      category: fields[2] as String,
      image: fields[3] as String,
      experience: fields[4] as String,
      bookingFee: fields[5] as double,
      available: fields[6] as bool,
      about: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StylistModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.experience)
      ..writeByte(5)
      ..write(obj.bookingFee)
      ..writeByte(6)
      ..write(obj.available)
      ..writeByte(7)
      ..write(obj.about);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StylistModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
