// import 'dart:html';
import 'package:ble_app/src/models/db/device_task_model.dart';
import 'package:ble_app/src/routes/router.gr.dart';
import 'package:ble_app/src/widgets/bottomsheet_widget.dart'; //! widget add/update
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'dart:developer'; //! for log data

import 'package:ble_app/src/global/global_text.dart';
import 'package:ble_app/src/models/db/device_model.dart';
import 'package:ble_app/src/provider/taskall_model_provider.dart';
import 'package:ble_app/src/widgets/device_task_tile.dart';
import 'package:flutter/material.dart';

import 'package:flutter_switch/flutter_switch.dart'; //* flutter toggle switch 
import 'package:auto_route/auto_route.dart'; //!auto route
class DevicesTaskScreen extends StatelessWidget {
  DevicesTaskScreen({Key? key, required this.solenoidDevice}) : super(key: key);
  // const SolenoidTaskScreen({required this.solenoid_task});
  final DeviceModel solenoidDevice;
  // final _formKey = GlobalKey<FormState>(); //TODO: Key controller
  final TextEditingController _titleController = TextEditingController(); //! can del code later  
  @override
  Widget build(BuildContext context) {
    context.watch<TaskAllModelProvider>().getAllSolenoidTask(solenoidDevice);
    context.watch<TaskAllModelProvider>().getAllDevice();

    Color kPrimaryColor = Color(0xff479100);
    Color kBackgroundColor = Color(0xffF4F4F4);
    Color kSecondaryTextColor = Color(0xff505780);
    Color kPinkColor = Color(0xffEC5DA9);
    Color kIconGreyColor = Color(0xffA6B7D4);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false, //TODO: Avoid bootom overflow when use keyboard
      backgroundColor: kBackgroundColor,
      body: SizedBox(
        height: screenSize.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              width: screenSize.width,
              height: 160,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                // color: kPrimaryColor, //! color main
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image:
                      ExactAssetImage('assets/images/icons/icon_png/infro.png'),
                  fit: BoxFit.fitWidth,
                )),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GlobalText(
                          text: (solenoidDevice != null)
                              ? 'Task Scheduler'
                              : 'null',
                          fontSize: 30,
                          color: Color.fromARGB(255, 0, 16, 43),
                        ),
                        Container(
                          height: 35.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                            // color: Colors.amber,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Icon(Icons.settings_input_component_rounded),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 110, 16, 0),
              // child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // padding: const EdgeInsets.all(10),
                    padding: const EdgeInsets.only(top: 5.0, right: 10.0, left: 10.0, bottom: 15.0),
                    width: screenSize.width,
                    // height: screenSize.height * 0.16,
                    height: screenSize.height * 0.1648,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // decoration: BoxDecoration(color: Colors.blue),
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
                                            decoration: BoxDecoration(
                                            // color: Colors.amber
                                            ),
                                            // height: screenSize.height * 0.5,
                                            // height: screenSize.height * 0.11,
                                            // width: screenSize.width * 0.24,
                                            // child:  AssetImage("assets/images/icons/icon_png/Solenoid.png"),
                                            child: SvgPicture.asset(
                                                'assets/images/icons/solenoid2.svg',
                                                // width: screenSize.width * 0.3,
                                                height: screenSize.height * 0.1,
                                                ),
                                            // child: Image(
                                            //   image: AssetImage(
                                            //     "assets/images/icons/icon_png/Solenoid_2.png",
                                            //   ),
                                            // ),
                                          ),
                                          // Text('data'),
                                          // SvgPicture.asset('assets/images/icons/solenoid2.svg'),
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
                                          GlobalText(text: solenoidDevice.title, fontSize: 25,fontHeightSpace: 0,),
                                          GlobalText(text: 'Status : ' '${(context.watch<TaskAllModelProvider>().active == true) ? 'ON | เปิด' : 'OFF | ปิด' }', fontSize: 18),
                                          // GlobalText(text: 'ค่าต่ำสุด(ON) : 40', fontSize: 14),
                                          // GlobalText(text: 'ค่าสูงสุด(OFF) : 50', fontSize: 14),
                                          // GlobalText(text: solenoidDevice.title, fontSize: 25,),
                                          // Text('เปิดการทำงานของอุปกรณ์'),
                                          // Text('data'),
                                              ],
                                            )
                                          ),
                                          // Text('data'),
                                          // Text('data'),
                                        ],
                                      ),
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
                                       log('Switch value : $val');
                                      // Provider.of(context)<TaskAllModelProvider>(context, listen: false).setActive(val);
                                      solenoidDevice.status = val;
                                      Provider.of<TaskAllModelProvider>(context, listen: false).updateDevice(solenoidDevice);
                                      Provider.of<TaskAllModelProvider>(context,
                                              listen: false)
                                          .setActive(val);
                                     },
                                  ),
                                ],
                              ),
                              // Text('data'),
                            ],
                          ),
                        ),
                        // SizedBox(height: 4,),
                        // Divider(height: 0,),
                        // SizedBox(height: 1,),
                        // Text('data is Test'),
                        // SizedBox(width: 2,),
                        //! show data % 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                   Icon(Icons.power_outlined, color: Colors.green,),
                                    const SizedBox(
                                        width: 8,
                                    ),
                                    GlobalText(text: 'text',fontSize: 16,)
                                ],
                              ),
                            ),
                           
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.power_off_outlined, color: Colors.red,),
                                  //  Icon(Icons.power_outlined, color: Colors.green,),
                                    const SizedBox(
                                        width: 8,
                                    ),
                                    GlobalText(text: 'text',fontSize: 16,)
                                ],
                              ),
                            ),
                            
                            // GlobalText(text: 'ค่าความชื้นในดินต่ำสุด(เปิด)',fontSize: 16,),
                            // GlobalText(text: 'ค่าความชื้นในดินต่ำสุด(ปิด)',fontSize: 16,),
                            // GlobalText(text: 'data is Test',fontSize: 16,)

                          ],
                        )

                      ],
                    ),
                  ),
                  // Container(
                  //   width: screenSize.width,
                  //   height: screenSize.height * 0.16,
                  //   // padding: const EdgeInsets.all(16),
                  //   padding: const EdgeInsets.only(right: 10, left: 3),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     // color: Colors.amber,
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       deviceShow(screenSize: screenSize, solenoidDevice: solenoidDevice, kSecondaryTextColor: kSecondaryTextColor),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 16,
                  ),
                  // GlobalText(text: '334'),
                  Consumer<TaskAllModelProvider>(
                    builder: (context, model, child) =>
                        //child: Container
                        Container(
                      width: screenSize.width,
                      height: screenSize.height * 0.63,
                      // height: screenSize.height * 0.63,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        // color: Colors.grey,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      // color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: screenSize.width,
                              height: screenSize.height * 0.6,
                              decoration: BoxDecoration(
                                // color: Colors.amber,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GlobalText(
                                            text: 'ตั้งค่าการทำงานอัตโนมัติ',
                                            fontSize: 18,
                                          ),
                                          GlobalText(
                                            text:
                                                'เปิดการทำงานอัตโนมัต ${context.watch<TaskAllModelProvider>().solenoidTaskList.length} รายการ',
                                            fontSize: 16,
                                          ),
                                        ],
                                      ),
                                      Switch(
                                        onChanged: (val) {
                                          log('Switch value : $val');
                                          // Provider.of(context)<TaskAllModelProvider>(context, listen: false).setActive(val);
                                          solenoidDevice.statusTask = val;
                                          log('${solenoidDevice.toJson()}');
                                          Provider.of<TaskAllModelProvider>(context, listen: false).updateDevice(solenoidDevice);
                                          Provider.of<TaskAllModelProvider>(
                                                  context,
                                                  listen: false)
                                              .setActiveTask(val);
                                        },
                                        value: solenoidDevice.statusTask,
                                        // value: context
                                        //     .watch<TaskAllModelProvider>()
                                        //     .activeTask,
                                      ),
                                      // Icon(Icons
                                      // .home), //! add toggle switch for add data
                                      //TODO: replace to toggle switch for add data
                                      // Text('JI')
                                    ],
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      // shrinkWrap: true,
                                      // itemCount: 3,
                                      itemCount: model.solenoidTaskList.length,
                                      itemBuilder: (context, index) {
                                        final taskList =
                                            model.solenoidTaskList[index];
                                        //? InkWell or Gesture
                                        return InkWell(
                                          child: DeviceTaskTile(
                                            device: solenoidDevice,
                                            task: taskList,
                                          ),
                                          onTap: () {
                                            bottomSheetWidget(context, 'update',
                                                solenoidDevice, taskList);
                                            log('id task is ${taskList.id}');
                                            log('id device is ${solenoidDevice.id}');
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          log('add');
          // inputItemDialog(context, 'add', solenoidtask);
          bottomSheetWidget(context, 'add', solenoidDevice, null);

          // context.router.push(AddUpdateTaskScreen(action: 'add', solenoidDevice: solenoidDevice, solenoidTaskDevice: null));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.lightBlue.shade300,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      // body: ,
    );
  }
}
// class deviceShow extends StatelessWidget {
//   const deviceShow({
//     Key? key,
//     required this.screenSize,
//     required this.solenoidDevice,
//     required this.kSecondaryTextColor,
//   }) : super(key: key);

//   final Size screenSize;
//   final DeviceModel solenoidDevice;
//   final Color kSecondaryTextColor;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // decoration: BoxDecoration(
//       //   color: Colors.amberAccent
//       // ),
//       child: Row(
//         children: [
//           Container(
//             // decoration: BoxDecoration(
//             // color: Colors.amber
//             // ),
//             // height: screenSize.height * 0.5,
//             height: screenSize.height * 0.11,
//             width: screenSize.width * 0.24,
//             // child:  AssetImage("assets/images/icons/icon_png/Solenoid.png"),
//             child: SvgPicture.asset('assets/images/icons/solenoid2.svg'),
//             // child: Image(
//             //   image: AssetImage(
//             //     "assets/images/icons/icon_png/Solenoid_2.png",
//             //   ),
//             // ),
//           ),
//           const SizedBox(
//             width: 5,
//           ),
//           Container(
//             width: screenSize.width * 0.63,
//             // decoration: BoxDecoration(
//             //   color: Colors.white
//             // ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     GlobalText(
//                       text: '${solenoidDevice.title}',
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     const SizedBox(
//                       height: 7,
//                     ),
//                     GlobalText(
//                       text: 'Eiei',
//                       fontSize: 12,
//                       color: kSecondaryTextColor,
//                     ),
//                     // Text('he'),
//                     // GlobalText(text: 'ทดสอบ'),
//                     // Text('he'),
//                   ],
//                 ),
//                 // GlobalText(text: 'P')
//                 // ElevatedButton(onPressed: (){}, child: const Text('PPP'),),
//                 Switch(
//                   onChanged: (val) {
//                     log('Switch value : $val');
//                     // Provider.of(context)<TaskAllModelProvider>(context, listen: false).setActive(val);
//                     Provider.of<TaskAllModelProvider>(context, listen: false)
//                         .setActive(val);
//                   },
//                   value: context.watch<TaskAllModelProvider>().active,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
