import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:ble_app/src/services/ble/reactive_state.dart';

class BleDeviceConnector extends ReactiveState<ConnectionStateUpdate> {
  BleDeviceConnector({
    required FlutterReactiveBle ble,
    required Function(String message) logMessage,
  })  : _ble = ble,
        _logMessage = logMessage;

  final FlutterReactiveBle _ble;
  final void Function(String message) _logMessage;

  @override
  Stream<ConnectionStateUpdate> get state => _deviceConnectionController.stream;

  final _deviceConnectionController = StreamController<ConnectionStateUpdate>();

  // ignore: cancel_subscriptions
  late StreamSubscription<ConnectionStateUpdate> _connection;

  Future<void> connect(String deviceId) async {
    _logMessage('Start connecting to $deviceId');
    _connection = _ble.connectToDevice(id: deviceId).listen(
      (update) {
        _logMessage(
            'ConnectionState for device $deviceId : ${update.connectionState}');
        _deviceConnectionController.add(update);
      },
      onError: (Object e) =>
          _logMessage('Connecting to device $deviceId resulted in error $e'),
    );
    //! Change mtu size 
    final mtu = await _ble.requestMtu(deviceId: deviceId, mtu: 517);
                    // final characteristic = QualifiedCharacteristic(serviceId: Uuid.parse('4fafc201-1fb5-459e-8fcc-c5c9c331914b'), characteristicId: Uuid.parse('6d68efe5-04b6-4a85-abc4-c2670b7bf7fd'), deviceId: '3C:71:BF:64:36:8E');
                    // String foo = '{id: 1, title: Solenoid ตัวที่ 1, date: null, status: true, statusTask: false, autoMode: 0 : 0}';
                    // List<int> bytes = utf8.encode(foo);
                    // log('Message sent with MTU is ${bytes.length} bytes.');
                    // _ble.writeCharacteristicWithResponse(characteristic, value: bytes);
    log('MTU Config is ${mtu}');
    
  }

  Future<void> disconnect(String deviceId) async {
    try {
      _logMessage('disconnecting to device: $deviceId');
      await _connection.cancel();
    } on Exception catch (e, _) {
      _logMessage("Error disconnecting from a device: $e");
    } finally {
      // Since [_connection] subscription is terminated, the "disconnected" state cannot be received and propagated
      _deviceConnectionController.add(
        ConnectionStateUpdate(
          deviceId: deviceId,
          connectionState: DeviceConnectionState.disconnected,
          failure: null,
        ),
      );
    }
  }

  Future<void> dispose() async {
    await _deviceConnectionController.close();
  }
}