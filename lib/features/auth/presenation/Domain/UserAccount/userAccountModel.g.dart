// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userAccountModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAccountModelAdapter extends TypeAdapter<UserAccountModel> {
  @override
  final int typeId = 1;

  @override
  UserAccountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserAccountModel(
      userName: fields[0] as String,
      password: fields[1] as String,
      email: fields[2] as String,
      gender: fields[3] as String,
      age: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UserAccountModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAccountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
