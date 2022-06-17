import 'dart:developer';

import 'package:ble_app/src/models/db/device_model.dart';
import 'package:ble_app/src/provider/interface_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../global/global_text.dart';
import '../models/db/device_task_model.dart';
import '../provider/taskall_model_provider.dart';



void bottomSheetWidget(
    //! SolenoidTaskModel? solenoidTaskCheck for get id of task for update
    BuildContext context,
    String action,
    DeviceModel solenoidDevice,
    DeviceTaskModel? solenoidTaskCheck) {
  // final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // GlobalKey<FormState> _timekey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  // List<bool> daySelect = [];

  //! set for update set field text data for update
  if (action == 'update') {
    _titleController.text = solenoidTaskCheck!.title;
  }
  final taskDB = Provider.of<TaskAllModelProvider>(context, listen: false);
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
            10, 10, 10, MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: 30,
                child: GlobalText(
                  text: action == 'add' ? 'Add Task' : 'Update Task',
                  fontSize: 25,
                )),
            const SizedBox(
              height: 16.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    validator: (value) {
                      return value!.trim().isNotEmpty ? null : 'Enter a task title';
                    },
                    onFieldSubmitted: (_) {
                      _formKey.currentState!.validate();
                    },
                    decoration: InputDecoration(
                        hintText: 'Title',
                        enabledBorder: customBorder(Colors.white),
                        focusedBorder: customBorder(Colors.black),
                        errorBorder: customBorder(Colors.red),
                        focusedErrorBorder: customBorder(Colors.red)),
                  ),
                  const SizedBox(height: 12,),
                  Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeekDayToggle(
                    text: 'Su',
                    current:
                    context.watch<InterfaceProvider>().days[0],
                    onToggle: (sunday) {
                      log('sunday is $sunday');
                      Provider.of<InterfaceProvider>(context, listen: false).setSunday(sunday);
                      log('${solenoidTaskCheck?.toJson()}');
                    }),
                WeekDayToggle(
                    text: 'Mo',
                    // current: true,
                    current: context.watch<InterfaceProvider>().days[1],
                    onToggle: (monday) {
                      Provider.of<InterfaceProvider>(context, listen: false).setMonday(monday);
                    }),
                WeekDayToggle(
                    text: 'Tu',
                    // current: false,
                    current: context.watch<InterfaceProvider>().days[2],
                    onToggle: (tuesday) {
                      Provider.of<InterfaceProvider>(context, listen: false).setTuesday(tuesday);
                    }),
                WeekDayToggle(
                    text: 'We',
                    current: context.watch<InterfaceProvider>().days[3],
                    onToggle: (wednesday) {
                      Provider.of<InterfaceProvider>(context, listen: false).setWednesday(wednesday);
                    }),
                WeekDayToggle(
                    text: 'Th',
                    // current: false,
                    current: context.watch<InterfaceProvider>().days[4],
                    onToggle: (thursday) {
                      Provider.of<InterfaceProvider>(context, listen: false).setThursday(thursday);
                    }),
                WeekDayToggle(
                    text: 'Fr',
                    current: context.watch<InterfaceProvider>().days[5],
                    onToggle: (friday) {
                      Provider.of<InterfaceProvider>(context, listen: false).setFriday(friday);
                    }),
                WeekDayToggle(
                    text: 'Sa',
                    current: context.watch<InterfaceProvider>().days[6],
                    onToggle: (saturday) {
                      Provider.of<InterfaceProvider>(context, listen: false).setSaturday(saturday);
                    }),
              ],
            ),
            const SizedBox(height: 12,),
                  TextFormField(
                    controller: _timeController,
                    validator: (value) {
                      return value!.trim().isNotEmpty ? null : 'Enter a task title';
                    },
                    onFieldSubmitted: (_) {
                      _formKey.currentState!.validate();
                    },
                    decoration: InputDecoration(
                        hintText: 'Time',
                        enabledBorder: customBorder(Colors.white),
                        focusedBorder: customBorder(Colors.black),
                        errorBorder: customBorder(Colors.red),
                        focusedErrorBorder: customBorder(Colors.red)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            // Form(
            //   key: _timekey,
            //   child: TextFormField(
            //     controller: _timeController,
            //     validator: (value){
            //       return value!.trim().isNotEmpty ? null : 'Enter a time';
            //     }, 
            //     onFieldSubmitted: (_){
            //       _timekey.currentState!.validate();
            //     },
            //     decoration: InputDecoration(
            //       hintText: 'Time',
            //       enabledBorder: customBorder(Colors.white),
            //         focusedBorder: customBorder(Colors.black),
            //         errorBorder: customBorder(Colors.red),
            //         focusedErrorBorder: customBorder(Colors.red)
            //     ),
            //   )
            // ),
            // const SizedBox(
            //   height: 15.0,
            // ),

            
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (action == 'add') {
                      DeviceTaskModel solenoidTask = DeviceTaskModel(
                        id: solenoidDevice.id,
                        title: _titleController.text,
                        date: DateTime.now(),
                        //! day select
                        // sunday: ,
                      );
                      log('${solenoidTask.toJson()}');
                      taskDB.addTask(solenoidDevice, solenoidTask);
                      log('Saved');
                    }
                    if (action == 'update') {
                      //? action == update
                      DeviceTaskModel solenoidTask = DeviceTaskModel(
                          id: solenoidTaskCheck!.id,
                          title: _titleController.text,
                          date: DateTime.now());
                      taskDB.updateTask(solenoidDevice, solenoidTask);
                      log('updated');
                    }
                    _titleController.clear();
                    Navigator.pop(context);
                  }
                  // taskDB.getAllSolenoidTask(solenoidTask);
                  // taskDB.getAllSolenoidTask(solenoidDevice);
                  // Navigator.pop(context);
                },
                child: GlobalText(
                  text: action == 'add' ? 'Save' : 'Update',
                  color: Colors.white,
                ))
          ],
        ),
      );
    },
  );
}

InputBorder customBorder(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
      width: 2,
    ),
  );
}

class WeekDayToggle extends StatelessWidget {
  const WeekDayToggle({
    Key? key,
    required this.text,
    required this.current,
    required this.onToggle,
  }) : super(key: key);

  final void Function(bool) onToggle;
  final bool current;
  final String text;
  @override
  Widget build(BuildContext context) {
    const size = 20.0;
    final textColor = current ? Colors.white : Colors.lightBlue;
    final blobColor = current ? Colors.lightBlue : Colors.white;
    return GestureDetector(
      child: SizedBox.fromSize(
        size: Size.fromRadius(size),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size),
            color: blobColor,
          ),
          child: Center(
            child: GlobalText(
              text: text,
              fontSize: 18,
              color: textColor,
            ),
          ),
        ),
      ),
      onTap: () => onToggle(!current),
    );
  }
}