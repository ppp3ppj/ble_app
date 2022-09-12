import 'dart:convert';
import 'dart:developer';

import 'package:ble_app/src/global/global_text.dart';
import 'package:ble_app/src/models/db/sensor_model.dart';
import 'package:ble_app/src/provider/ble/ble_model_provider.dart';
import 'package:ble_app/src/services/ble/ble_device_interactor.dart';
import 'package:ble_app/src/widgets/sensor/sensor_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SensorTile extends StatelessWidget {
  final _ble = FlutterReactiveBle();
  SensorTile({
    required this.sensorDevice,
    Key? key,
    }) : super(key: key);
  final SensorModel sensorDevice;

  // late String readOutput;

  // Future<void> readCharacteristic() async {
  //   final result = await widget.readCharacteristic(widget.characteristic);
  //   // setState(() {
  //     readOutput = result.toString();
  //   // });
  // }
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // shrinkWrap: true,
      crossAxisCount: 1,
      primary: false,
      // scrollDirection: Axis.vertical,
      childAspectRatio: 0.8,
      padding: const EdgeInsets.all(5),
      crossAxisSpacing: 10,
      mainAxisSpacing: 20,
      children: [
        InkWell(
          onTap: (){
            // log('tap');
            //TODO: use this when can manage ble + esp32 done or is ok
            // sensorShowDialog(context, sensorDevice);
          },
          child: Container(
            // width:  MediaQuery.of(context).size.width * 0.6,
            // height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              // color: Colors.blue,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  color: Colors.grey.shade500,
                  // color: Colors.grey.withOpacity(0.5), //shadow color
                  // spreadRadius: 5, // spread radius
                  // blurRadius: 7, // shadow blur radius
                  // offset: const Offset(0, 3), 
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment : CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: (sensorDevice.value >= 50.0) ? SvgPicture.asset(
                      "assets/images/icons/sensor1.svg",
                      width: 120,
                      height: 120,
                    )
                    : SvgPicture.asset(
                      "assets/images/icons/sensor2.svg",
                      width: 120,
                      height: 120,
                    ) ,
                  ),
                  const SizedBox(height: 6,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GlobalText(text: sensorDevice.name, fontSize: 20,),
                      Consumer2<BleDeviceInteractor, BleModelProvider>(
                        builder: (context, value1, value2, child) {
                          // loadData(value2.bleDevice.bleId.toString());

                          return GlobalText(text: 'jj', fontSize: 12, fontHeightSpace: 1.0,);
                          // final result = value1.readCharacteristic(QualifiedCharacteristic(
                          // characteristicId: Uuid.parse("6d68efe5-04b6-4a85-abc4-c2670b7bf7fd"), 
                          // serviceId: Uuid.parse("4fafc201-1fb5-459e-8fcc-c5c9c331914b"), 
                          // deviceId: value2.bleDevice.id.toString()));
                          // final j = result.whenComplete(() => null,);
                          // return GlobalText(text: j.toString(), fontSize: 30, fontHeightSpace: 1.0,);
                        }
                        //  GlobalText(text: sensorDevice.value.toString() + '%', fontSize: 30, fontHeightSpace: 1.0,)
                        
                      ),
                      // GlobalText(text: 'Timedate sensor read', fontSize: 12, fontHeightSpace: 1.0,),
                      GlobalText(text: sensorDevice.uuid, fontSize: 12, fontHeightSpace: 1.0,),
                    ],
                  )
                  // GlobalText(text: 'jjjj'),
                  // GlobalText(text: 'jjjj'),
                  // GlobalText(text: 'jjjj'),
                ],
              ),
            ) 
          ),
        ),
        
        // GlobalText(text: 'ppp')
        // SizedBox(
        //   width:  MediaQuery.of(context).size.width * 0.6,
        //   height: MediaQuery.of(context).size.height * 0.4,
        //   child:
        //    Card(
            
        //     color: Colors.white,
        //     elevation: 2.0,
        //     // elevation: 0.0,
        //     shape: const RoundedRectangleBorder(
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(10),
        //         bottomLeft: Radius.circular(10),
        //         bottomRight: Radius.circular(10),
        //         topRight: Radius.circular(10),
        //       ),
        //     ),
        //   ),
          
        // )

      // Container(
      //     // margin: const EdgeInsets.only(left: 10.0,top: 10.0, right: 10),
      //     padding: const EdgeInsets.only(top: 10.0),
      //     // width: 225,
      //     // height: 165,
      //     // height: 170, 
      //     // width: 160,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(8),
      //       boxShadow: [
      //         BoxShadow(
      //            color: Color(0x3f000000),
      //            blurRadius: 4,
      //            offset: Offset(0, 4)
      //         )
      //       ],
      //       // color: Colors.white,
      //       color: Colors.green,
      //     ),
      //     child: Column(
      //       // crossAxisAlignment: CrossAxisAlignment.start,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         // Text("data")
      //         const Padding(padding: 
      //           EdgeInsets.only(left: 18.0),
      //           child: Text('Sensor ตัวที่ 1',style: TextStyle(fontSize: 15,)),
      //         ),
      //         const SizedBox(height: 40,),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //          children: [
      //           //  Center(child: Text('data'))
      //           Text('100 %',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
      //           // SizedBox(height: 30,),
      //          ], 
      //         ),
      //         const SizedBox(height: 30,),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: [
      //             Padding(padding: 
      //               EdgeInsets.only(right: 15.0),child: Icon(Icons.home,size: 30,),
      //             ),
      //           ],
      //         ) 
      //             // Center(child: Text("100 %",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),)),
             
      //       ],
      //     ),
      //   ) 
      ],
    );
  }
  // void loadData(String devId) async {
  //   // late String valueShowStr;
  // //   _ble.subscribeToCharacteristic(characteristic)
  // final characteristicValueNotify = QualifiedCharacteristic(
  //         serviceId: Uuid.parse("4fafc201-1fb5-459e-8fcc-c5c9c331914b"),
  //         characteristicId: Uuid.parse("6d68efe5-04b6-4a85-abc4-c2670b7bf7fd"),
  //         deviceId: devId,
  //       );
  //       _ble.subscribeToCharacteristic(characteristicValueNotify).listen((data) {
  //         // log('$data');
  //         String dataStr = utf8.decode(data);
  //         log(dataStr);
  //         // setState(() {
  //           // valueShowStr = dataStr;
  //         // });

  //       });
  // // return valueShowStr; 
  // }

}
