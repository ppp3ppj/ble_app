import 'package:ble_app/src/global/global_text.dart';
import 'package:flutter/material.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Logs Screen'),
      // ),
      body: Center(child: GlobalText(text: 'Log Screen not yet?',fontSize: 20,)),
    );
  }
}