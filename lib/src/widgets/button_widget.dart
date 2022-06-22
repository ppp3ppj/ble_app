import 'package:ble_app/src/global/global_text.dart';
import 'package:flutter/material.dart';


class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key, 
    this.label, 
    required this.color, 
    required this.onTap
    }) : super(key: key);

  final label;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 50,
        alignment: Alignment.center,
        // child: Text(label, s),
        child: GlobalText(text: label,color: Colors.white, fontSize: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}