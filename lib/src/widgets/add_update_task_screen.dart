import 'dart:developer';

import 'package:ble_app/src/global/global_text.dart';
import 'package:ble_app/src/models/db/device_model.dart';
import 'package:ble_app/src/models/db/device_task_model.dart';
import 'package:ble_app/src/provider/interface_provider.dart';
import 'package:ble_app/src/provider/taskall_model_provider.dart';
import 'package:ble_app/src/widgets/button_widget.dart';
import 'package:ble_app/src/widgets/input_field.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart'; //! datetime format

class AddUpdateTaskScreen extends StatelessWidget {
  const AddUpdateTaskScreen(
      {Key? key,
      required this.action,
      required this.solenoidDevice,
      required this.solenoidTaskDevice})
      : super(key: key);
  final String action;
  final DeviceModel solenoidDevice;
  final DeviceTaskModel? solenoidTaskDevice;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _startTimeController = TextEditingController();
    final TextEditingController _endTimeController = TextEditingController();
    // String _selectedDate = DateFormat.yMd().format(DateTime.now());
    // String _startDate = DateFormat('hh:mm a').format(DateTime.now());
    String _startDate = DateFormat('HH:MM').format(DateTime.now());
    String _endDate =
        DateFormat('hh:mm a').format(DateTime.now().add(Duration(minutes: 15)));
    // String _endDate =
    //     DateFormat('HH:MM').format(DateTime.now().add(const Duration(minutes: 15)));
    final taskDB = Provider.of<TaskAllModelProvider>(context, listen: false);

     Future<void> _selectStartTime(BuildContext context) async {
      final int startTimeHour = Provider.of<InterfaceProvider>(context, listen: false).times[0];
      final int startTimeMinute= Provider.of<InterfaceProvider>(context, listen: false).times[1];
      // final int startTimeMinute = context.watch<InterfaceProvider>().times[1];
      final TimeOfDay? selected = await showTimePicker(
        context: context,
        initialTime: action == 'add' ? TimeOfDay(hour: startTimeHour,minute: startTimeMinute) : TimeOfDay.now(),
      );
      // if (!mounted) return;
      String formattedTime = selected!.format(context);
      // log('${selected?.hour} : ${selected?.minute} ${selected?.period.name}');
      if(selected != null) { 
        // log(selected.replacing(hour: selected.hourOfPeriod).toString());
      Provider.of<InterfaceProvider>(context, listen: false).setHour(selected.hour);
      Provider.of<InterfaceProvider>(context, listen: false).setMinute(selected.minute);
      Provider.of<InterfaceProvider>(context, listen: false).setStartDate(selected.hour.toString() + ':' + selected.minute.toString());
      _startDate = selected.toString();
        _startTimeController.text = _startDate;
        log(_startDate);
      }
    }

    void _selectTime(BuildContext context) async {
      final TimeOfDay? newTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
      log('${newTime.toString()}');
      if(newTime != null) {
        _startDate = newTime.toString();
      }


    } 

    

    _submitStartTime() {
      _startTimeController.text = _startDate;
    }

    _submitEndTime() {
      _endTimeController.text = _endDate;
    }


    Widget _buildTimePick(String title, bool ifPickedTime, TimeOfDay currentTime,
      Function(TimeOfDay) onTimePicked) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            title,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(20),
          ),
          child: GestureDetector(
            child: Text(
              currentTime.format(context),
            ),
            onTap: () {
              // selectedTime(context, ifPickedTime, currentTime, onTimePicked);
            },
          ),
        ),
      ],
    );
  }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(action == 'add' ? 'Add' : 'Update'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlobalText(
                        text: action == 'add' ? 'Add' : 'Update',
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InputField(
                    isEnabled: true,
                    controller: _titleController,
                    hint: 'Enter Title',
                    label: 'Title',
                    iconOrdrop: 'icon',
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 165,
                        child: InputField(
                          isEnabled: false,
                          controller: _startTimeController,
                          label: 'Start Time',
                          iconOrdrop: 'button',
                          // hint: _startDate.toString(),
                          hint: context.watch<InterfaceProvider>().startDate.toString(),

                          widget: IconButton(
                            icon: Icon(
                              Icons.access_time,
                            ),
                            onPressed: () {
                              _selectStartTime(context);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 165,
                        child: InputField(
                          isEnabled: false,
                          controller: _endTimeController,
                          label: 'End Time',
                          iconOrdrop: 'button',
                          hint: _endDate.toString(),
                          widget: IconButton(
                            icon: Icon(
                              Icons.access_time,
                            ),
                            onPressed: () {
                              _selectTime(context);
                              // _selectEndTime(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ButtonWidget(
                          label: action == 'add' ? 'Add Task' : 'Update Task',
                          color: Colors.blueAccent,
                          onTap: () {
                            log('hi tap');
                            // _submitStartTime();
                            // _submitEndTime();
                            // _startTimeController.text = _startDate;
                            if (_formKey.currentState!.validate()) {
                              log('hi');
                              //   //TODO: add Task here
                              if (action == 'add') {
                                DeviceTaskModel solenoidTask = DeviceTaskModel(
                                  id: solenoidDevice.id,
                                  title: _titleController.text,
                                  date: DateTime.now(),
                                );
                                log('${solenoidTask.toJson()}');
                                taskDB.addTask(solenoidDevice, solenoidTask);
                                log('saved');
                              }
                              // _titleController.clear();
                              context.router.pop(context);
                            }
                          })
                    ],
                  )
                ],
              )),
        )),
      ),
    );
  }
}
