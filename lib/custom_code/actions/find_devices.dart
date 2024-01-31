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
  FlutterBluetoothSerial bluetoothSerial = FlutterBluetoothSerial.instance;

  List<BluetoothDiscoveryResult> results = [];
  List<BTDeviceStruct> devices = [];

  // Start discovery
  await for (BluetoothDiscoveryResult result in bluetoothSerial.startDiscovery()) {
    results.add(result);
  }

  print(results);
  for (BluetoothDiscoveryResult r in results) {
    if (r.device.name != null && r.device.name!.isNotEmpty) {
      devices.add(BTDeviceStruct(
        name: r.device.name,
        id: r.device.address,
        // RSSI is not typically available for classic Bluetooth devices in this context
      ));
    }
  }

  return devices;
}