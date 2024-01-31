// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

Future<bool> connectDevice(BTDeviceStruct deviceInfo) async {
  final device = BluetoothDevice(address: deviceInfo.id, name: deviceInfo.name);
  try {
    await BluetoothConnection.toAddress(device.address).then((connection) {
      print('Connected to the device');
      // Save the connection instance
    });
  } catch (e) {
    print(e);
  }
  return true;
}

void sendData(String data) async {
  // Send data to the device
  connection.output.add(utf8.encode(data + "\r\n"));
  await connection.output.allSent;
  print('Data sent');
}

void receiveData() async {
  // Receive data from the device
  connection.input.listen((Uint8List data) {
    print('Data incoming: ${ascii.decode(data)}');
  }).onDone(() {
    print('Disconnected by remote request');
  });
}
