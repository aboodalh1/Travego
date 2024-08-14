// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<LocalUser> {
  @override
  final int typeId = 2;

  @override
  LocalUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalUser(
      id_user: fields[0] as num,
      firstName_user: fields[1] as String,
      lastName_user: fields[2] as String,
      email_user: fields[3] as String,
      creationDate_user: fields[4] as String,
      phoneNumber_user: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalUser obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id_user)
      ..writeByte(1)
      ..write(obj.firstName_user)
      ..writeByte(2)
      ..write(obj.lastName_user)
      ..writeByte(3)
      ..write(obj.email_user)
      ..writeByte(4)
      ..write(obj.creationDate_user)
      ..writeByte(5)
      ..write(obj.phoneNumber_user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
