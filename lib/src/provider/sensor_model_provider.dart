import 'dart:developer';

import 'package:ble_app/src/models/db/sensor_model.dart';
import 'package:flutter/foundation.dart';

import 'package:hive_flutter/hive_flutter.dart';

class SensorModelProvider extends ChangeNotifier {
  List<SensorModel> sensorListTest = [
    SensorModel(id: 1, name: 'Sensor ตัวที่ 1', value: 50.0),
    SensorModel(id: 2, name: 'Sensor ตัวที่ 2', value: 33.0),
    SensorModel(id: 3, name: 'Sensor ตัวที่ 3', value: 44.1),
    SensorModel(id: 4, name: 'Sensor ตัวที่ 4', value: 55.2),
    // SensorModel(id: 5, name: 'Sensor ตัวที่ 5'),
  ];
  List<SensorModel> _sensorDeviceList = []; //variable private
  List<SensorModel> get sensorDeviceList => _sensorDeviceList.toList(); //getter 

  Future<void> updateSensor(SensorModel sensorDevice) async { // setter 
    final sensorDB = await Hive.openBox<SensorModel>('sensor_db'); 
    log('${sensorDevice.toJson()}');
    await sensorDB.put(sensorDevice.id, sensorDevice);
    getAllSensor();
  }

  Future<void> getAllSensor() async { //set to list
    final sensorDB = await Hive.openBox<SensorModel>('sensor_db');
    _sensorDeviceList.clear();
    _sensorDeviceList.addAll(sensorDB.values);
    notifyListeners(); 
  }

}