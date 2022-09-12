import 'dart:convert';

import 'package:ble_app/src/global/global_text.dart';
import 'package:ble_app/src/models/db/device_model.dart';
import 'package:ble_app/src/provider/ble/ble_model_provider.dart';
import 'package:ble_app/src/provider/taskall_model_provider.dart';
import 'package:ble_app/src/routes/router.gr.dart';
import 'package:ble_app/src/services/ble/ble_device_interactor.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart'; //? Flutter svg
import 'dart:developer'; //! log()
import 'package:auto_route/auto_route.dart';
import 'package:flutter_switch/flutter_switch.dart'; //* flutter toggle switch
import 'package:provider/provider.dart'; //! provider

//! flutter ble services 
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
// import 'package:ble_app/src/services/ble/ble_device_interactor.dart';
class DeviceTile extends StatelessWidget {
  const DeviceTile({Key? key, required this.solenoidDevice}) : super(key: key);

  final DeviceModel solenoidDevice;
  //!ble
  // final FlutterReactiveBle ble;

  @override
  Widget build(BuildContext context) {
    // final String assetName = 'assets/images/icons/solenoid_1.svg';
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    // return solenoid_card1(heightSize, widthSize);
    return InkWell(
        //! use InkWell or GestureDetector
        onTap: () {
          // log('tap');
          // router.push(SolenoidTaskScreen(solenoidtask: solenoidList));
          // context.router.push(SolenoidTaskScreen(solenoidtask: solenoidList));
          context.router
              .push(DevicesTaskScreen(solenoidDevice: solenoidDevice));
        },
        child: solenoidlist(context, widthSize, heightSize));
    // child: solenoid_card1(heightSize, widthSize));
  }

  Container solenoidlist(BuildContext context,double widthSize, double heightSize) {
    return Container(
      width: widthSize,
      height: heightSize * 0.14,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        // color: Colors.amber,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.grey.shade500,
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Container(
                    // padding: const EdgeInsets.all(10),
                    padding: const EdgeInsets.only(top: 5.0, right: 10.0, left: 10.0, bottom: 5.0),
                    width: widthSize,
                    height: heightSize * 0.16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: SvgPicture.asset(
                                            'assets/images/icons/solenoid1.svg',
                                            // width: screenSize.width * 0.3,
                                            height: heightSize * 0.1,
                                            ),
                                      ),

                                      SizedBox(
                                        width: 12.0,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          // color: Colors.white,
                                          // color: Colors.amber
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                      GlobalText(text: solenoidDevice.title, fontSize: 22, fontHeightSpace: 0, fontWeight: FontWeight.bold,),
                                      //TODO: Do it later it's wait TODO Done
                                      // GlobalText(text: 'เเก้ไขล่าสุด :  an hour ago' , fontSize: 16, color: Colors.grey,),
                                      // GlobalText(text: 'การทำงานอัตโนมัติ : เปิด' , fontSize: 16, color: Colors.grey,),
                                      GlobalText(text: 'ความชื้น ON  : ${solenoidDevice.autoMinOn} %' , fontSize: 16, color: Colors.grey, fontHeightSpace: 1.2,),
                                      GlobalText(text: 'ความชื้น OFF : ${solenoidDevice.autoMaxOff} %' , fontSize: 16, color: Colors.grey, fontHeightSpace: 1.2,),
                                      // GlobalText(text: 'Status : เปิด', fontSize: 18),
                                      // GlobalText(text: solenoidDevice.title, fontSize: 25,),
                                          ],
                                        )
                                      ),
                                      // Text('data'),
                                      // Text('data'),
                                    ],
                                  ),
                                  // Text('data'),
                                  // Text('data'),
                                  // Text('data'),
                                  // Text('data'),
                                ],
                              ),
                              // Text('data'),
                              // Switch(
                              //   onChanged: (val) {
                              //     log('Switch value : $val');
                              //     // Provider.of(context)<TaskAllModelProvider>(context, listen: false).setActive(val);
                              //     Provider.of<TaskAllModelProvider>(context,
                              //             listen: false)
                              //         .setActive(val);
                              //   },
                              //   value: context
                              //       .watch<TaskAllModelProvider>()
                              //       .active,
                              // ),
                              FlutterSwitch(
                                // width: 125.0,
  
                                // width: screenSize.width * 1,
                                width: 55,
                                height: 30,
                                // height: screenSize.height * 0.05,
                                // value: context
                                //     .watch<TaskAllModelProvider>()
                                //     .active,
                                value: solenoidDevice.status,
                                 onToggle: (val) {
                                  // final _ble = ble
                                  solenoidDevice.status = val;
                                  final characteristic = QualifiedCharacteristic(serviceId: Uuid.parse('4fafc201-1fb5-459e-8fcc-c5c9c331914b'), characteristicId: Uuid.parse('6d68efe5-04b6-4a85-abc4-c2670b7bf7fd'), deviceId: '3C:71:BF:64:36:8E');
                                  // log()
                                  final jsonDevice = json.encode(solenoidDevice.toJson());
                                  // log()

                                  //? can fix same jsonDevice
                                  // final jsonDevice2 = JsonEncoder.withIndent(' ').convert(solenoidDevice.toJson());
                                  log('Json --> $jsonDevice');
                                  // List<int> bytes = utf8.encode(json.encode(jsonDevice)); //wrong twice encode 
                                  List<int> bytes = utf8.encode(jsonDevice);
                                  log('Message sent with MTU is ${bytes.length} bytes.');
                                   log('Switch value : $val');
                                   //TODO: Fix format date/time now plese
                                  //  solenoidDevice.date = DateTime.now();
                                    // log(message) 
                                    // solenoidDevice.status = val ;
                                    // Provider
                                   log('${solenoidDevice.toJson()}');
                                  // context.read<BleModelProvider>().bleDevice;
                                  log(Provider.of<BleModelProvider>(context, listen: false).bleDevice.toJson().toString());
                                  // Provider.value<>(value: value);
                                  Provider.of<BleDeviceInteractor>(context, listen: false).discoverServices(
                                    Provider.of<BleModelProvider>(context, listen: false).bleDevice.bleId.toString()
                                  );
                                  Provider.of<BleDeviceInteractor>(context, listen: false).writeCharacterisiticWithResponse(characteristic, bytes);


                                  // log()
                                  // Provider.of<BleModelProvider>(context, listen: false).bleDevice;
                                  // Provider.of(context)<TaskAllModelProvider>(context, listen: false).setActive(val);
                                  Provider.of<TaskAllModelProvider>(context, listen: false).updateDevice(solenoidDevice);
                                  Provider.of<TaskAllModelProvider>(context,
                                          listen: false)
                                      .setActive(val);
                                 },
                              )
                            ],
                          ),
                          // Text('data'),
                        ],
                      ),
                    ),
                  ),
      // child: Row(
      //   children: [
      //     Expanded(
      //       child: Image(
      //           image: AssetImage('assets/images/icons/icon_png/Solenoid.png')),
      //     ),
      //     Expanded(
      //       flex: 3,
      //       child: Column(
      //         children: [
      //           Expanded(
      //             child: Container(
      //               padding: const EdgeInsets.only(left: 10),
      //               alignment: Alignment.bottomLeft,
      //               child: GlobalText(
      //                 text: '${solenoidDevice.title}',
      //                 fontSize: 16,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //               // child: SolenoidText(
      //               //   text: solenoidDevice.title,
      //               //   fontSize: 16,
      //               //   fontWeight: FontWeight.bold,
      //               // ),
      //             ),
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               // Text('data'),
      //               // Text('data')
      //                 Container(
      //                   padding: const EdgeInsets.only(left: 10),
      //                   alignment: Alignment.bottomLeft,
      //                   child: GlobalText(
      //                     text: 'ID : ${solenoidDevice.id}',
      //                     fontSize: 16,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                   // child: SolenoidText(
      //                   //   text: 'ID : ${solenoidDevice.id}',
      //                   //   fontSize: 16,
      //                   //   fontWeight: FontWeight.bold,
      //                   // )
      //                 ),
      //                 Text('data')
      //             ],
      //           ),
      //           // Expanded(
      //           //   child: Container(
      //           //     padding: const EdgeInsets.only(left: 10),
      //           //     alignment: Alignment.bottomLeft,
      //           //     child: GlobalText(
      //           //       text: 'ID : ${solenoidDevice.id}',
      //           //       fontSize: 16,
      //           //       fontWeight: FontWeight.bold,
      //           //     ),
      //           //     // child: SolenoidText(
      //           //     //   text: 'ID : ${solenoidDevice.id}',
      //           //     //   fontSize: 16,
      //           //     //   fontWeight: FontWeight.bold,
      //           //     // )
      //           //   ),
      //           // ),
      //           // Expanded(
      //           //   child: GlobalText(text: 'Hi',)
      //           // ),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }

}
