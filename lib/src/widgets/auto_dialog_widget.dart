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
                   
                      if(_formKey.currentState!.validate()) {   
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
