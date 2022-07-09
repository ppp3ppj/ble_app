import 'dart:developer';

import 'package:ble_app/src/models/db/device_model.dart';
import 'package:ble_app/src/provider/interface_provider.dart';
import 'package:ble_app/src/widgets/input_field.dart';
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

  final TextEditingController _titleController = TextEditingController();
  // final TextEditingController _timeController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

   TimeOfDay? _startDate; 
   TimeOfDay? _endDate; 
  //! check user error
  int durationStartDate = 0;
  int durationEndDate = 0;
  int durationResultError = 0;

  List<bool?> _daysDate = [false, false, false, false, false, false, false];
  // List<bool> daySelect = [];
  //! set for update set field text data for update
  if (action == 'update') {
    _titleController.text = solenoidTaskCheck!.title;
    _startTimeController.text = solenoidTaskCheck.startDate;
    _endTimeController.text = solenoidTaskCheck.endDate;

    _startDate =  TimeOfDay(hour:int.parse(solenoidTaskCheck.startDate.split(":")[0]),minute: int.parse(solenoidTaskCheck.startDate.split(":")[1].split(" ")[0]));
    _endDate =  TimeOfDay(hour:int.parse(solenoidTaskCheck.endDate.split(":")[0]),minute: int.parse(solenoidTaskCheck.endDate.split(":")[1].split(" ")[0]));

    //? Provider for update
    Provider.of<InterfaceProvider>(context, listen: false).setSunday(solenoidTaskCheck.sunday!);
    Provider.of<InterfaceProvider>(context, listen: false).setMonday(solenoidTaskCheck.monday!);
    Provider.of<InterfaceProvider>(context, listen: false).setTuesday(solenoidTaskCheck.tuesday!);
    Provider.of<InterfaceProvider>(context, listen: false).setWednesday(solenoidTaskCheck.wednesday!);
    Provider.of<InterfaceProvider>(context, listen: false).setThursday(solenoidTaskCheck.thursday!);
    Provider.of<InterfaceProvider>(context, listen: false).setFriday(solenoidTaskCheck.friday!);
    Provider.of<InterfaceProvider>(context, listen: false).setSaturday(solenoidTaskCheck.saturday!);
    _daysDate[0] = solenoidTaskCheck.days[0];
    _daysDate[1] = solenoidTaskCheck.days[1];
    _daysDate[2] = solenoidTaskCheck.days[2];
    _daysDate[3] = solenoidTaskCheck.days[3];
    _daysDate[4] = solenoidTaskCheck.days[4];
    _daysDate[5] = solenoidTaskCheck.days[5];
    _daysDate[6] = solenoidTaskCheck.days[6];
    

  }

  //!time diff check user error
  getTime(startTime, endTime) {
    bool result = false;
    int startTimeInt = (startTime.hour * 60 + startTime.minute) * 60;
    int EndTimeInt = (endTime.hour * 60 + endTime.minute) * 60;
    int dif = EndTimeInt - startTimeInt;
    log('Duration in sec is ${dif} sec, in minute is ${dif/60} min.');

    if (EndTimeInt > startTimeInt) {
      result = true;
    } else {
      result = false;
    }
    return result;
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
      return GestureDetector(
        onTap: (){
          //! add widget GestureDetector for dismiss keyboard 
          FocusScopeNode currentFocus = FocusScope.of(context);
           if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              // 10, 10, 10, MediaQuery.of(context).viewInsets.bottom),
              10, 10, 10, MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputField(
                        isEnabled: true, 
                        controller: _titleController,
                        hint: 'Enter Title', 
                        label: 'Title', 
                        iconOrdrop: 'icon',
                      ),
                      // GlobalText(text: 'Title',fontSize: 17,), 
                      // const SizedBox(height: 5,),
                      // TextFormField(
                      //   controller: _titleController,
                      //   validator: (value) {
                      //     return value!.trim().isNotEmpty ? null : 'Enter a task title';
                      //   },
                      //   onFieldSubmitted: (_) {
                      //     _formKey.currentState!.validate();
                      //   },
                      //   decoration: InputDecoration(
                      //       // isCollapsed: true,
                      //       // label: GlobalText(text: 'Title',),
                      //       hintText: 'Enter Title',
                      //       enabledBorder: customBorder(Colors.white),
                      //       focusedBorder: customBorder(Colors.black),
                      //       errorBorder: customBorder(Colors.red),
                      //       focusedErrorBorder: customBorder(Colors.red)),
                      // ),
                      
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
                              hint: '',
                              widget: IconButton(
                                icon: Icon(
                                  Icons.access_time,
                                ),
                                onPressed: () async {
                                if(action == 'add') {
                                  final time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                                    if(time != null) {
                                      log('${time.format(context)}'); 
                                      log('${time.toString()}');
      
                                      //!24 hr no zero
                                      // _startTimeController.text = '${time.hour}:${time.minute}'; 
                                      //! 12 hr am/pm
                                      _startTimeController.text = '${time.format(context)}'; 
                                      _startDate = time;
      
                                    } 
                                  }
                                if(action == 'update') { 
                                  TimeOfDay _startTimeUpdate = TimeOfDay(hour:int.parse(solenoidTaskCheck!.startDate.split(":")[0]),minute: int.parse(solenoidTaskCheck.startDate.split(":")[1].split(" ")[0]));
                                  final time = await showTimePicker(context: context, initialTime: _startTimeUpdate);
                                  log('update : $time');
                                  if(time != null) {
                                    //! 12 hr am/pm
                                    _startTimeController.text = '${time.format(context)}'; 
                                    _startDate = time;
                                  } 
                                    
                                  
                                  
                                }
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
                              hint: '',
                              widget: IconButton(
                                icon: Icon(
                                  Icons.access_time,
                                ),
                                onPressed: () async {
                                  if(action == 'add') {
                                    final time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                                      if(time != null) {
                                      log('${time.format(context)}'); 
                                      log('${time.toString()}');
                                      //!24 hr no zero
                                      // _endTimeController.text = '${time.hour}:${time.minute}'; 
                                      //! 12 hr am/pm
                                      _endTimeController.text = '${time.format(context)}'; 
                                      _endDate = time;
      
                                      }
                                    } 
                                  if(action == 'update') {
                                    //? convert string "12:22 AM" --> TimeOfDay 12 22 
                                    TimeOfDay _endTimeUpdate = TimeOfDay(hour:int.parse(solenoidTaskCheck!.endDate.split(":")[0]),minute: int.parse(solenoidTaskCheck.endDate.split(":")[1].split(" ")[0]));
                                    // log('time TimeOfDay is ${time}');
                                    final time = await showTimePicker(context: context, initialTime: _endTimeUpdate);
                                    if(time != null) {
                                      _endTimeController.text = '${time.format(context)}';  //? 12hr
                                      _endDate = time;
                                    } 
                                    // if(time == null) {
                                    //   _endTimeController.text = solenoidTaskCheck.endDate;
                                    //   _endDate = _endTimeUpdate;
                                    //   log('Now endtime is null');
                                    // }

                                  }
                                  },
                              ),
      
                            ),
                          )
                        ],
                      ),
      
                      const SizedBox(height: 12,),
                      GlobalText(text: 'Duration', fontSize: 17, fontWeight: FontWeight.bold,),
                      const SizedBox(height: 2,),
                      GlobalText(text: 'Repeat Day', fontSize: 17,),
                      const SizedBox(height: 5,),
                      Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WeekDayToggle(
                        text: 'Su',
                        current: 
                        // action == 'add' ?  context.watch<InterfaceProvider>().days[0] : context.watch<InterfaceProvider>().days[0],
                         context.watch<InterfaceProvider>().days[0],

                        
                        onToggle: (sunday) {
                           
                            Provider.of<InterfaceProvider>(context, listen: false).setSunday(sunday);
                         
                            _daysDate[0] = sunday;
                          
                         

                          
                        }),
                    WeekDayToggle(
                        text: 'Mo',
                        // current: true,
                        // current: context.watch<InterfaceProvider>().days[1],
                        current : context.watch<InterfaceProvider>().days[1],
                        // current : action == 'add' ?  context.watch<InterfaceProvider>().days[1] : solenoidTaskCheck!.days[1],
                        onToggle: (monday) {
                  
                            Provider.of<InterfaceProvider>(context, listen: false).setMonday(monday);
                            _daysDate[1] = monday;
                       
                         
                        }),
                    WeekDayToggle(
                        text: 'Tu',
                        // current: false,
                        // current: context.watch<InterfaceProvider>().days[2],
                        current : context.watch<InterfaceProvider>().days[2],
                        onToggle: (tuesday) {
                          Provider.of<InterfaceProvider>(context, listen: false).setTuesday(tuesday);
                          _daysDate[2] = tuesday;
                        }),
                    WeekDayToggle(
                        text: 'We',
                        current :context.watch<InterfaceProvider>().days[3],
                        // current: context.watch<InterfaceProvider>().days[3],
                        onToggle: (wednesday) {
                          Provider.of<InterfaceProvider>(context, listen: false).setWednesday(wednesday);
                          _daysDate[3] = wednesday;
                        }),
                    WeekDayToggle(
                        text: 'Th',
                        // current: false,
                        // current: solenoidTaskCheck.days[4], 
                        current :context.watch<InterfaceProvider>().days[4],
                        // current: context.watch<InterfaceProvider>().days[4],
                        onToggle: (thursday) {
                          Provider.of<InterfaceProvider>(context, listen: false).setThursday(thursday);
                          _daysDate[4] = thursday;

                        }),
                    WeekDayToggle(
                        text: 'Fr',
                        current : context.watch<InterfaceProvider>().days[5],
                        // current: solenoidTaskCheck.days[5], 
                        // current: context.watch<InterfaceProvider>().days[5],
                        onToggle: (friday) {
                          Provider.of<InterfaceProvider>(context, listen: false).setFriday(friday);
                          _daysDate[5] = friday;
                        }),
                    WeekDayToggle(
                        text: 'Sa',
                        current : context.watch<InterfaceProvider>().days[6],
                        // current: solenoidTaskCheck.days[6], 
                        // current: context.watch<InterfaceProvider>().days[6],
                        onToggle: (saturday) {
                          Provider.of<InterfaceProvider>(context, listen: false).setSaturday(saturday);
                          _daysDate[6] = saturday;
                        }),
                  ],
                ),
          
                // const SizedBox(height: 12,),
                // Slider(
                //   value: Provider.of<InterfaceProvider>(context).currentValueSlider, 
                //   onChanged: (value) {
                //      Provider.of<InterfaceProvider>(context, listen: false).changeValueSlider(value);
                //      log('Slider value is ${value}');
                //   },
                // ),
                // RangeSlider(
                //   values: RangeValues(Provider.of<InterfaceProvider>(context).startValueRangeSlider,Provider.of<InterfaceProvider>(context).endValueRangeSlider), 
                //   onChanged: (values) {
                //     Provider.of<InterfaceProvider>(context, listen: false).changeValueRangeSlider(values.start, values.end);
                //     log('Values Start :${values.start*100}');
                //     log('Values End :${values.end*100}');
                //   },
                // ),
                //       TextFormField(
                //         // enabled: false,
                        
                //         controller: _timeController,
                //         validator: (value) {
                //           return value!.trim().isNotEmpty ? null : 'Enter a task title';
                //         },
                //         onFieldSubmitted: (_) {
                //           _formKey.currentState!.validate();
                //         },
                //         decoration: InputDecoration(
                //             hintText: 'Time',
                //             enabledBorder: customBorder(Colors.white),
                //             focusedBorder: customBorder(Colors.black),
                //             errorBorder: customBorder(Colors.red),
                //             focusedErrorBorder: customBorder(Colors.red),
                //         ),
                //         // onTap: () async {
                //         //   final time = await showTimePicker(context: context, initialTime: TimeOfDay(
                //         //     hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute,));
                //         //     if(time != null) {
                //         //       _timeController.text = '${time.hour}:${time.minute}';
                //         //     }
                //         // },
                //       ),
                      // InputField(label: 'ppp', hint: 'Enter if', iconOrdrop: 'icon', isEnabled: true),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //   InputField(
                      //   label: 'Start Time', 
                      //   hint: 'Enter if', 
                      //   iconOrdrop: 'button', 
                      //   isEnabled: false,
                      //   widget: IconButton(onPressed: (){}, icon: Icon(Icons.access_time)),
                      //   ), 
                      //    InputField(
                      //   label: 'End Time', 
                      //   hint: 'Enter if', 
                      //   iconOrdrop: 'button', 
                      //   isEnabled: false,
                      //   widget: IconButton(onPressed: (){}, icon: Icon(Icons.access_time)),
                      //   ), 
                      //   ], 
                        
                      // ),
                      
                      
          
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
          
                
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      // log('${_daysDate.contains(true)}');
                      if (_formKey.currentState!.validate()) {
                        if (action == 'add' && getTime(_startDate, _endDate) && _daysDate.contains(true)) { //! contain is mean user must select repeat day one day can be save
                          // get
                          // log("${_daysDate}");
                          log('State time is ${getTime(_startDate, _endDate)}');
                          DeviceTaskModel solenoidTask = DeviceTaskModel(
                            id: solenoidDevice.id,
                            title: _titleController.text,
                            date: DateTime.now(),
                            startDate: _startTimeController.text,
                            endDate:  _endTimeController.text,
                            
                            //! day select
                            sunday: _daysDate[0],
                            monday: _daysDate[1],
                            tuesday: _daysDate[2],
                            wednesday: _daysDate[3],
                            thursday: _daysDate[4],
                            friday: _daysDate[5],
                            saturday: _daysDate[6],

                            // sunday: ,
                          );
                          log('${solenoidTask.toJson()}');
                          taskDB.addTask(solenoidDevice, solenoidTask);
                          log('value is = ${Provider.of<InterfaceProvider>(context, listen: false).days.contains(true)}');
                          log('Saved');
                          _titleController.clear();
                          _startTimeController.clear();
                          _endTimeController.clear();
                          //? reset day in provider
                          Provider.of<InterfaceProvider>(context, listen: false).setSunday(false);
                          Provider.of<InterfaceProvider>(context, listen: false).setMonday(false);
                          Provider.of<InterfaceProvider>(context, listen: false).setTuesday(false);
                          Provider.of<InterfaceProvider>(context, listen: false).setWednesday(false);
                          Provider.of<InterfaceProvider>(context, listen: false).setThursday(false);
                          Provider.of<InterfaceProvider>(context, listen: false).setFriday(false);
                          Provider.of<InterfaceProvider>(context, listen: false).setSaturday(false);
                          Navigator.pop(context);
                        }
                        if (action == 'update' && getTime(_startDate, _endDate) && _daysDate.contains(true) ) { //! contains use must select one day data can update
                          log('State time is ${getTime(_startDate, _endDate)}');
                          //? action == update
                          DeviceTaskModel solenoidTask = DeviceTaskModel(
                              id: solenoidTaskCheck!.id,
                              title: _titleController.text,
                              date: DateTime.now(),
                              startDate: _startTimeController.text,
                              endDate:  _endTimeController.text,
                              //! day select
                              sunday: _daysDate[0],
                              monday: _daysDate[1],
                              tuesday: _daysDate[2],
                              wednesday: _daysDate[3],
                              thursday: _daysDate[4],
                              friday: _daysDate[5],
                              saturday: _daysDate[6],
                              );
                          taskDB.updateTask(solenoidDevice, solenoidTask);
                          log('updated');
                            _titleController.clear();
                          //!clear Provider status
                          Provider.of<InterfaceProvider>(context, listen: false).setSunday(false);
                          Provider.of<InterfaceProvider>(context, listen: false).setMonday(false);
                          Provider.of<InterfaceProvider>(context, listen: false).setTuesday(false);
                          Provider.of<InterfaceProvider>(context, listen: false).setWednesday(false);
                          Provider.of<InterfaceProvider>(context, listen: false).setThursday(false);
                          Provider.of<InterfaceProvider>(context, listen: false).setFriday(false);
                          Provider.of<InterfaceProvider>(context, listen: false).setSaturday(false);
                        Navigator.pop(context);
                        }
                        // _titleController.clear();
                        // Navigator.pop(context);
                      }
                      // taskDB.getAllSolenoidTask(solenoidTask);
                      // taskDB.getAllSolenoidTask(solenoidDevice);
                      // Navigator.pop(context);
                    },
                    child: GlobalText(
                      text: action == 'add' ? 'Save' : 'Update',
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                      )
                    ),
                  ),
                    const SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      );
    },
  ).whenComplete((){ 
    //! for bottomsheet exit 
    log('Exit');
    Provider.of<InterfaceProvider>(context, listen: false).setSunday(false);
    Provider.of<InterfaceProvider>(context, listen: false).setMonday(false);
    Provider.of<InterfaceProvider>(context, listen: false).setTuesday(false);
    Provider.of<InterfaceProvider>(context, listen: false).setWednesday(false);
    Provider.of<InterfaceProvider>(context, listen: false).setThursday(false);
    Provider.of<InterfaceProvider>(context, listen: false).setFriday(false);
    Provider.of<InterfaceProvider>(context, listen: false).setSaturday(false);
  });
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