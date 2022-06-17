import 'package:flutter/material.dart';

class GlobalText extends StatelessWidget {
  const GlobalText({
    Key? key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.fontFamily = 'Kanit',
    this.fontHeightSpace = 0.0,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String fontFamily;
  final double fontHeightSpace;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        height: fontHeightSpace,
        // letterSpacing: 1.0,
      ),
    );
  }
}
