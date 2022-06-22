import 'dart:developer';

import 'package:ble_app/src/global/global_text.dart';
import 'package:ble_app/src/models/db/device_task_model.dart';
import 'package:ble_app/src/models/db/device_model.dart';
import 'package:ble_app/src/provider/interface_provider.dart';
import 'package:ble_app/src/provider/taskall_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart'; //? slideable
import 'package:provider/provider.dart';

// const dates = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
const dates = ['Su','Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];

class DeviceTaskTile extends StatelessWidget {
  // final List<bool> dayEnable;
  const DeviceTaskTile({
    Key? key,
    required this.device,
    required this.task,
    }) : super(key: key);

    final DeviceModel device;
    final DeviceTaskModel task;
    

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Slidable(
      child: Container(
        width: screenSize.width,
        // height: screenSize.height * 0.15,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          // color: Colors.amber, //! check container
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.grey.shade500,
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
                  GlobalText(
                    // text: '00:00 - 00: 00',
                    text: '${task.title}',
                    // text: widget.task.ti,
                    fontSize: 18,
                  ),
                // ],
              // ),
              GlobalText(
                // text: 'การตั้งค่าการทำงาน',
                text: '${task.startDate} - ${task.endDate}',
                fontSize: 20,
              ),
              SizedBox.fromSize(
               size: Size(190, 25), 
              child :Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                  dates.asMap().entries.map((indexStringPair) {
                    final dayString = indexStringPair.value;
                    final index = indexStringPair.key;
                    return Text(
                      dayString,
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 17,
                        // color: context.watch<InterfaceProvider>().days[index] ? Colors.green : Colors.grey,
                        // fontWeight: context.watch<InterfaceProvider>().days[index] ? FontWeight.bold : FontWeight.normal,
                        //! check day in local Storage
                        //TODO: use storage to collect data and show - day  
                        color: task.days[index] ? Colors.green : Colors.grey,
                        fontWeight: task.days[index] ? FontWeight.bold : FontWeight.normal,
                      ),
                    );
                } ).toList(), 
              ), 
          ),
              // Text(
              //   '${dates.asMap().entries.map((e){
              //     final dayString = e.value;
              //     final index = e.key;
              //     return '${dayString}';
              //   })}',
              //   style: TextStyle(
              //   ),
                
              // ),
              // GlobalText(
              //   // text: 'จ. อ. พ. พฤ. ศ. ส. อา.',
              //   // text: '${List.filled(7, context.watch<InterfaceProvider>().days)}',
              //   text: '${dates.asMap().entries.map((e){
              //     final dayString = e.value;
              //     final index = e.key;
              //     return '${dayString}';
              //   })}',
              //   // color: ,
              //   fontSize: 18,
              // )
              
            ],
          ),
        ),
      ),
      //! Slideable action
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          //! Del
          TaskTileActions(
              color: Colors.red,
              // color: Colors.white,

              icon: Icons.delete,
              onTap: () {
                //? call provider and use function in provider model
                final taskManage= Provider.of<TaskAllModelProvider>(context, listen: false);
                log('Del');
                log('${TimeOfDay.now()}');
                taskManage.deleteTask(device, task.id!);
              }),
        ],
      ),
    );
  }
}

class TaskTileActions extends StatelessWidget {
  const TaskTileActions({
    Key? key,
    required this.color,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        width: screenSize.width * 0.25,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.grey.shade500,
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white, //! backgroundColor
        ),
      ),
      onTap: onTap,
    );
  }
}
