import 'dart:developer';

import 'package:ble_app/src/models/db/ble_data/ble_device_model.dart';
import 'package:ble_app/src/models/functional_data_model/ble_device_interaction_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart'; //! ble
class BleModelProvider extends ChangeNotifier {
  // List<BleDeviceModel> _bleDeviceList = [];
  // List<BleDeviceModel> get bleDeviceList => _bleDeviceList.toList();
  BleDeviceModel _bleDevice = BleDeviceModel(1, '', '');
  BleDeviceModel get bleDevice => _bleDevice;

  //? discoveredServices
  List<DiscoveredService> _discoveredServices = [];
  List<DiscoveredService> get discoveredServices => _discoveredServices.toList();

  Future<void> getBleConfig() async { //set to list
    final bleDB = await Hive.openBox<BleDeviceModel>('ble_config_db');
    _bleDevice = BleDeviceModel(1, '', '');
    _bleDevice.id = bleDB.get(1)?.id;
    _bleDevice.bleId = bleDB.get(1)?.bleId; 
    _bleDevice.bleName = bleDB.get(1)?.bleName;
    // log('${_bleDeviceList[0].toJson()}');
    notifyListeners(); 
  }

  Future<void> updateConfig(BleDeviceModel bleDevice) async { // setter 
    final bleDB = await Hive.openBox<BleDeviceModel>('ble_config_db'); 
    // log('${sensorDevice.toJson()}');
    await bleDB.put(bleDevice.id, bleDevice);
    getBleConfig();
  }

  //? discoverServices find service on device connected
  Future<void> discoverServices(BleDeviceInteractionViewModel viewModelBle) async {
    final result = await viewModelBle.discoverServices(); 
    log('Result to service is $result');
    _discoveredServices = result;
    notifyListeners();
    // final result = await widget.viewModel.discoverServices();
    // setState(() {
      // discoveredServices = result;
    // });
  }
}
