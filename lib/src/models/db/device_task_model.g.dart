// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeviceTaskModelAdapter extends TypeAdapter<DeviceTaskModel> {
  @override
  final int typeId = 2;

  @override
  DeviceTaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeviceTaskModel(
      id: fields[0] as int?,
      title: fields[2] as String,
      date: fields[1] as DateTime,
      status: fields[3] as bool,
      startDate: fields[4] as String,
      endDate: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DeviceTaskModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.startDate)
      ..writeByte(5)
      ..write(obj.endDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
