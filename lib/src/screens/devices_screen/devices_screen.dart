import 'package:ble_app/src/models/db/device_model.dart';
import 'package:ble_app/src/provider/taskall_model_provider.dart';
import 'package:ble_app/src/widgets/device_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:developer'; //! log() function

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    context.watch<TaskAllModelProvider>().getAllDevice();
    return Consumer<TaskAllModelProvider>(builder: (context, value, child) {
      return Scaffold(
        body: ListView.builder(
          itemCount: value.solenoidList.length,
          itemBuilder: (context, index) {
              // log('index : ${index}, value : ${value.solenoid_list[index].id}'); 
              // log('${value.solenoid_list[0]}');
              // log('${value.solenoid_list[index]}');
              return DeviceTile(solenoidDevice: value.solenoidList[index],);
          },
          ),
          // flo

      );
    });
  }
}
