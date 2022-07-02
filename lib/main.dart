import 'dart:developer';
// import 'dart:math';

import 'package:ble_app/src/models/constant.dart';
import 'package:ble_app/src/models/db/device_task_model.dart';
import 'package:ble_app/src/models/db/device_model.dart';
import 'package:ble_app/src/models/db/sensor_model.dart';
import 'package:ble_app/src/provider/interface_provider.dart';
import 'package:ble_app/src/provider/sensor_model_provider.dart';
import 'package:ble_app/src/provider/taskall_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:ble_app/src/routes/router.gr.dart'; //? route
import 'package:provider/provider.dart'; //? provider
//! hive
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'dart:io'; //! Derectory
// import 'package:ble_app/src/models/db/solenoid_task_model.g.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  // await Hive.initFlutter();
  // if(!Hive.isAdapterRegistered(SolenoidTaskModelAdapter().typeId)) {
  //   Hive.registerAdapter(SolenoidTaskModelAdapter());
  // }
  Hive.init(directory.path);

  if(!Hive.isAdapterRegistered(DeviceModelAdapter().typeId)) {
    Hive.registerAdapter(DeviceModelAdapter());
    List<DeviceModel> listDeviceModel = [
      DeviceModel(id: 1, title: 'Solenoid ตัวที่ 1'),
      DeviceModel(id: 2, title: 'Solenoid ตัวที่ 2'),
      DeviceModel(id: 3, title: 'Solenoid ตัวที่ 3'),
      DeviceModel(id: 4, title: 'Solenoid ตัวที่ 4'),
      DeviceModel(id: 5, title: 'Solenoid ตัวที่ 5'),
    ];


    addDeviceData(listDeviceModel[0]);
    addDeviceData(listDeviceModel[1]);
    addDeviceData(listDeviceModel[2]);
    addDeviceData(listDeviceModel[3]);
    addDeviceData(listDeviceModel[4]);
    // addDeviceData(listDeviceModel[1]);
    log('Hive registerAdapter : Done at Type id : ${DeviceModelAdapter().typeId}');
  }
  if(!Hive.isAdapterRegistered(DeviceTaskModelAdapter().typeId)) {
    Hive.registerAdapter(DeviceTaskModelAdapter());
    log('Hive registerAdapter : Done at Type id : ${DeviceTaskModelAdapter().typeId}');
  }

  if(!Hive.isAdapterRegistered(SensorModelAdapter().typeId)) {
    Hive.registerAdapter(SensorModelAdapter());
    List<SensorModel> listSensorModel = [
       SensorModel(id: 1, name: 'Sensor ตัวที่ 1'),
       SensorModel(id: 2, name: 'Sensor ตัวที่ 2'),
       SensorModel(id: 3, name: 'Sensor ตัวที่ 3'),
    ];
    addSensorDevice(listSensorModel[0]);
    addSensorDevice(listSensorModel[1]);
    addSensorDevice(listSensorModel[2]);
    log('Hive registerAdapter : Done at Type id : ${SensorModelAdapter().typeId}');
  }

  

  
  // Hive.registerAdapter(DeviceTaskModelAdapter());
  runApp(
      MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TaskAllModelProvider()),
      ChangeNotifierProvider(create: (_) => InterfaceProvider()),
      ChangeNotifierProvider(create: (_) => SensorModelProvider()), //? sensor provider
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
