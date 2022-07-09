import 'package:ble_app/src/global/global_text.dart';
import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalText(text: 'this is information screen'),
    );
  }
}