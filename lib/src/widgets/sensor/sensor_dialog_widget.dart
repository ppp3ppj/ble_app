import 'package:ble_app/src/global/global_text.dart';
import 'package:ble_app/src/models/db/sensor_model.dart';
import 'package:ble_app/src/widgets/input_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

Future<void> sensorShowDialog(BuildContext context, SensorModel sensorDevice) {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          title: Form(
            key: _formKey,
            child: Column(
              children: [
                GlobalText(
                  text: sensorDevice.name,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                InputField(
                  isEnabled: true,
                  hint: 'Enter UUID',
                  label: 'UUID', 
                  iconOrdrop: 'icon',
                  ),
                InputField(
                  isEnabled: false,
                  hint: sensorDevice.value.toString(),
                  label: 'Humidity in Soil', 
                  iconOrdrop: 'icon',
                  ),
                  const SizedBox(
                    height: 7.0,
                  ),
                  
              ],
            ),
          ),
        ),
      );
    },
  );
}
