import 'package:ble_app/src/global/global_text.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key, 
    required this.isEnabled,
    required this.hint, 
    required this.label, 
    this.controller, 
    this.iconData, 
    required this.iconOrdrop, 
    this.widget, 
    }) : super(key: key);

  final String label;
  final TextEditingController? controller;
  final IconData? iconData;
  final String hint;
  final String iconOrdrop;
  final Widget? widget;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // GlobalText(text: widget?.label),
        // Text(label),
        GlobalText(text: label, color:  Color(0xFF121212), fontSize: 17, fontWeight: FontWeight.bold,),
        const SizedBox(height: 5),
        TextFormField(
          readOnly: !isEnabled,
          controller: controller,
          validator: (value){
            if(value.toString().isEmpty) {
              return 'Please Enter ${label}';
            }
          },
          cursorColor: Color(0xFF121212),
          style: TextStyle(color: Color(0xFF121212)),
          decoration: InputDecoration(
            suffixIcon: iconOrdrop == 'icon' ? Icon(iconData,color: Colors.grey,) 
            : Container(margin: EdgeInsets.only(right: 10),child: widget,),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: customBorder(Colors.grey),
            focusedBorder: customBorder(Colors.green),
            // enabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(
            //     width: 1,
            //     // color: Color(0xFF4e5ae8),
            //     color: Colors.green
            //   ),
            //   borderRadius: BorderRadius.circular(10)),
            // focusedBorder: OutlineInputBorder(
            //   borderSide: BorderSide(
            //     width: 2, //! can 1 
            //     // color: Color(0xFF4e5ae8),
            //     color: Colors.green
            //   ),
            //   borderRadius: BorderRadius.circular(10)), 
              errorBorder: customBorder(Colors.red),
              focusedErrorBorder: customBorder(Colors.red),
              


          ),
        ),
      ],
    );
  }
}

InputBorder customBorder(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}