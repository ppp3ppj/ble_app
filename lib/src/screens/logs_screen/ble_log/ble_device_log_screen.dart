import 'package:ble_app/src/services/ble/ble_logger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class BleDeviceLogScreen extends StatelessWidget {
  const BleDeviceLogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<BleLogger> (
    builder: (context, logger, _) => BleDeviceLog(
      messages: logger.messages,
    ),
  );
  
}

class BleDeviceLog extends StatelessWidget {
  const BleDeviceLog({
    required this.messages, 
    Key? key
  }) : super(key: key);

  final List<String> messages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemBuilder: (context, index) => Text(messages[index]),
          itemCount: messages.length,
        ),
      ),
    );
  }
}