import 'dart:developer';

import 'package:ble_app/src/models/db/device_task_model.dart';
import 'package:ble_app/src/models/db/device_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'dart:convert'; //? use for JsonEncode

class TaskAllModelProvider extends ChangeNotifier {
  bool active = false;
  bool activeTask = false;

  Future<void> setActive(bool value) async {
    // Mock slow database call ↓
    // await Future.delayed(Duration(milliseconds: 50), () {
      active = value;
      log('Async DB call DONE.');
    // });
    notifyListeners();
  }
  Future<void> setActiveTask(bool value) async {
    activeTask = value;
  }

  //TODO: Create getter for solenoid device
  List<DeviceModel> _solenoidList = [
    //TODO: store in local data base plese :() 
    // DeviceModel(id: 1, title: 'Solenoid ตัวที่ 1'),
    // DeviceModel(id: 2, title: 'Solenoid ตัวที่ 2'),
    // DeviceModel(id: 3, title: 'Solenoid ตัวที่ 3'),
    // DeviceModel(id: 4, title: 'Solenoid ตัวที่ 4'),
    // DeviceModel(id: 5, title: 'Solenoid ตัวที่ 5'),
  ];
  List<DeviceModel> get solenoidList => _solenoidList.toList();

  List<DeviceTaskModel> _solenoidTaskList = []; //? taskList
  List<DeviceTaskModel> get solenoidTaskList => _solenoidTaskList.toList();

  // Map<SolenoidTaskModel> mapData = _solenoidTaskList.toString().asMap(); 

  Future addTask(DeviceModel device, DeviceTaskModel task) async {
    log('devide : ${device.id}');
    log('task : ${task.id}');
    final taskDB = await Hive.openBox<DeviceTaskModel>('${device.id}');
    final id = await taskDB.add(task);
    task.id = id;
    log('task.id : ${task.id}, device.id : ${device.id}');
    taskDB.put(task.id, task);
    _solenoidTaskList.add(task);
    //? log for device : solenoid 
    log(device.toJson().toString());
    log(task.toJson().toString());
    notifyListeners();
  }

  Future<void> deleteTask(DeviceModel device, int id) async {
    final taskDB = await Hive.openBox<DeviceTaskModel>('${device.id}');
    await taskDB.delete(id);
    getAllSolenoidTask(device);
  }

  Future<void> getAllSolenoidTask(DeviceModel device) async {
    final taskDB = await Hive.openBox<DeviceTaskModel>('${device.id}');
    _solenoidTaskList.clear();
    _solenoidTaskList.addAll(taskDB.values);
    notifyListeners();
  }


  Future<void> updateTask(DeviceModel device, DeviceTaskModel task) async {
    log('task id = ${device.id}');
    final taskDB = await Hive.openBox<DeviceTaskModel>('${device.id}');
    await taskDB.put(task.id, task);
  }
  //TODO: Map object to json for view log data

  //!fucntion for Solenoid Device
  Future<void> getAllDevice() async {
  final taskDB = await Hive.openBox<DeviceModel>('device_db');
  _solenoidList.clear();
  _solenoidList.addAll(taskDB.values);
  notifyListeners();
  }

  Future<void> updateDevice(DeviceModel device) async {
    final taskDB = await Hive.openBox<DeviceModel>('device_db');
    log('${device.toJson()}');
    await taskDB.put(device.id, device);
    getAllDevice();
  }

}


