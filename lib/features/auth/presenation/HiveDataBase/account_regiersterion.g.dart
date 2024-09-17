// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_regiersterion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountRegiersterionAdapter extends TypeAdapter<AccountRegiersterion> {
  @override
  final int typeId = 9;

  @override
  AccountRegiersterion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountRegiersterion()
      ..createdDate = fields[10] as DateTime
      ..userAccount = (fields[11] as List).cast<UserAccountModel>()
      ..courses = (fields[13] as List).cast<Lecture>();
  }

  @override
  void write(BinaryWriter writer, AccountRegiersterion obj) {
    writer
      ..writeByte(3)
      ..writeByte(10)
      ..write(obj.createdDate)
      ..writeByte(11)
      ..write(obj.userAccount)
      ..writeByte(13)
      ..write(obj.courses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountRegiersterionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

