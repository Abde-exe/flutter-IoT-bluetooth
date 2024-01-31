// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

Future<bool> isBluetoothEnabled() async {
  final FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;

  final state = await bluetooth.state;
  if (state == BluetoothState.STATE_ON) {
    print("Bluetooth is enabled");
    return true;
  }
  print("Bluetooth is disabled");
  return false;
}
