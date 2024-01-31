// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

late BluetoothConnection
    connection; // Global variable for the Bluetooth connection

Future<bool> connectDevice(BTDeviceStruct deviceInfo) async {
  final device = BluetoothDevice(address: deviceInfo.id, name: deviceInfo.name);
  try {
    connection = await BluetoothConnection.toAddress(device.address);
    print('Connected to the device');
    return true; // Return true if connection is successful
  } catch (e) {
    print(e);
    return false; // Return false if connection fails
  }
}

void sendData(String data) async {
  if (connection != null && connection.isConnected) {
    connection.output.add(utf8.encode(data + "\r\n"));
    await connection.output.allSent;
    print('Data sent');
  } else {
    print('No connection established');
  }
}

void receiveData() async {
  if (connection != null) {
    connection.input.listen((Uint8List data) {
      print('Data incoming: ${ascii.decode(data)}');
    }).onDone(() {
      print('Disconnected by remote request');
    });
  } else {
    print('No connection established');
  }
}
