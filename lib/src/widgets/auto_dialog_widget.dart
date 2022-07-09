import 'dart:developer';

import 'package:ble_app/src/global/global_text.dart';
import 'package:ble_app/src/models/db/device_model.dart';
import 'package:ble_app/src/provider/taskall_model_provider.dart';
import 'package:ble_app/src/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; //! provider

Future<void> autoShowDialog(BuildContext context, DeviceModel solenoidDevice) {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _minController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();

  //! set controller.text when click first
  // _minController.text = solenoidDevice.autoMinOn.toString();
  // _maxController.text = solenoidDevice.autoMaxOff.toString();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            //! add widget GestureDetector for dismiss keyboard
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            title: Form(
              key: _formKey, //! add key 
              child: Column(
                children: [
                  GlobalText(
                    text: 'Auto Mode : ${solenoidDevice.id}',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  InputField(
                    isEnabled: true,
                    keyBoardType: TextInputType.number,
                    controller: _minController,
                    // hint: '0 is Disable auto mode',
                    hint: solenoidDevice.autoMinOn.toString(),
                    label: 'ค่าต่ำสุด(เปิด)',
                    iconOrdrop: 'icon',
                  ),
                  InputField(
                    isEnabled: true,
                    keyBoardType: TextInputType.number,
                    controller: _maxController,
                    // hint: '0 is Disable auto mode',
                    hint: solenoidDevice.autoMaxOff.toString(),
                    label: 'ค่าสูงสุด(ปิด)',
                    iconOrdrop: 'icon',
                  ),
                  const SizedBox(
                    height: 7.0,
                  ),
                  ElevatedButton(
                    child: GlobalText(
                      text: 'Submit',
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      )
                    ),
                    onPressed: () {
                        RegExp double2decimal =
                          // RegExp(r'^(\d+(\.\d{0,2})?|\.?\d{1,2})$');
                          RegExp(r'^(?:-?(?:[0-9]+))?(?:\.[0-9]*)?(?:[eE][\+\-]?(?:[0-9]+))?$');
                          // RegExp(r'^((?:[0-9]+))?(?:\.[0-9]*)?(?:[eE][\+\-]?(?:[0-9]+))?$');
                        RegExp _numeric = RegExp(r'^[0-9]+$');
                          log('${_minController.text} : ${_maxController.text}');
                          if(_numeric.hasMatch(_minController.text) == false || _numeric.hasMatch(_maxController.text) == false) {
                            _minController.clear();
                            _maxController.clear();
                          }
                          // if(
                          //   (_minController.text == '-' && _maxController.text == '-') 
                          //   || _maxController.text == '-' 
                          //   || _minController.text == '-' 
                          //   && (_minController.text == ' ' && _maxController.text == ' ') 
                          //   || _maxController.text == ' ' 
                          //   || _minController.text == ' ' 
                          //   && (_minController.text == '.' && _maxController.text == '.') 
                          //   || _maxController.text == '.' 
                          //   || _minController.text == '.' 
                          //   && (_minController.text == ',' && _maxController.text == ',') 
                          //   || _maxController.text == ',' 
                          //   || _minController.text == ',' 
                          //   ) {
                          //   _minController.clear();
                          //   _maxController.clear();
                          // }
                          //TODO: if value is same i think error
                      if(_formKey.currentState!.validate()) {   
                        if( ( (int.tryParse(_minController.text))! >= 0 && (int.tryParse(_maxController.text))! >= 0 ) 
                        && ( (int.tryParse(_minController.text))! <= 100 && (int.tryParse(_maxController.text))! <= 100 ) 
                        && checkInputController(min: _minController.text, max: _maxController.text) == true
                        ) {
                          log(checkInputController(min: _minController.text, max: _maxController.text).toString());
                          log('${_minController.text} : ${_maxController.text}');
                          //* type cast string to int
                          solenoidDevice.autoMinOn = int.tryParse(_minController.text)!;
                          solenoidDevice.autoMaxOff = int.tryParse(_maxController.text)!;
                          log('${solenoidDevice.toJson()}');
                          //! update value to hive database
                          Provider.of<TaskAllModelProvider>(context, listen: false).updateDevice(solenoidDevice);
                          //* pop context 
                          Navigator.pop(context);
                        } 
                      } 
                    },
                  ),
                  GlobalText(text: '*หมายเหตุ หากต้องการยกเลิก Auto Mode', color: Colors.grey,fontWeight: FontWeight.bold,),
                  GlobalText(text: 'โปรดตั้งค่าเปิด-ปิด เท่ากับ 0 ด้วย', color: Colors.grey,),
                ],
              ),
            ),
          ),
        );
      });
}


//?for check min must have less then max value
bool checkInputController({required String min, required String max}) {
  bool isChecked = false;
  if((int.tryParse(min)! < int.tryParse(max)!) || (int.tryParse(min)! == 0 && int.tryParse(max)! == 0) ) {
    isChecked = true;
  } else {
    isChecked = false;
  }

  return isChecked;
}