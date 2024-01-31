// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

Future<List<BTDeviceStruct>> findDevices() async {
  final bluetooth = FlutterBluetoothSerial.instance;
  List<BTDeviceStruct> devices = [];
  bluetooth.startDiscovery().listen((result) {
    if (result.device.name.isNotEmpty) {
      devices.add(BTDeviceStruct(
        name: result.device.name,
        id: result.device.address,
        rssi: result.rssi,
      ));
    }
  });
  await Future.delayed(const Duration(seconds: 5));
  bluetooth.cancelDiscovery();
  devices.sort((a, b) => b.rssi.compareTo(a.rssi));
  return devices;
}
