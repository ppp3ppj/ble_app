import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'ble_device_model.g.dart';

@HiveType(typeId: 4)
class BleDeviceModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? bleId;

  @HiveField(2)
  String? bleName;

  BleDeviceModel(this.id, this.bleId, this.bleName);

  Map<String, dynamic> toJson() => {
    'id': id,
    'ble_id' : bleId,
    'ble_name': bleName,
  };
}