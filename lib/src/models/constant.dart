import 'dart:developer';

import 'package:ble_app/src/models/db/device_model.dart';
import 'package:ble_app/src/models/db/sensor_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// List<DeviceModel> listDeviceModel = [
//   DeviceModel(id: 1, title: 'Solenoid ตัวที่ 1'),
//   DeviceModel(id: 2, title: 'Solenoid ตัวที่ 2'),
//   DeviceModel(id: 3, title: 'Solenoid ตัวที่ 3'),
//   DeviceModel(id: 4, title: 'Solenoid ตัวที่ 4'),
//   DeviceModel(id: 5, title: 'Solenoid ตัวที่ 5'),
// ];

Future<void> addDeviceData(DeviceModel device) async {
  final deviceDB = await Hive.openBox<DeviceModel>('device_db');
  // final id = await deviceDB.add(device);
  // if()
  final check = await deviceDB.get(device.id);
  // log('$id');
  log('${device.id}');
  // log('${check.id}');
  if(check?.id == null){
    deviceDB.put(device.id, device);
    log('crete device done');
  }
  log('dont create');
  // if(check == )
}

Future<void> addSensorDevice(SensorModel sensorDevice) async {
  final sensorDB = await Hive.openBox<SensorModel>('sensor_db');
  final check = await sensorDB.get(sensorDevice.id);
  log('${sensorDevice.id}');
  if(check?.id == null) {
    sensorDB.put(sensorDevice.id, sensorDevice);
    log('Create sensor device is done');
  }
  log('dont create sensor device');
}
