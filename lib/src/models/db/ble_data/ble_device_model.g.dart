// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_device_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BleDeviceModelAdapter extends TypeAdapter<BleDeviceModel> {
  @override
  final int typeId = 4;

  @override
  BleDeviceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BleDeviceModel(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BleDeviceModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.bleId)
      ..writeByte(2)
      ..write(obj.bleName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BleDeviceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
