import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'display_received_data_widget.dart' show DisplayReceivedDataWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DisplayReceivedDataModel
    extends FlutterFlowModel<DisplayReceivedDataWidget> {
  ///  Local state fields for this component.

  String? data;

  List<String> humidityList = [];
  void addToHumidityList(String item) => humidityList.add(item);
  void removeFromHumidityList(String item) => humidityList.remove(item);
  void removeAtIndexFromHumidityList(int index) => humidityList.removeAt(index);
  void insertAtIndexInHumidityList(int index, String item) =>
      humidityList.insert(index, item);
  void updateHumidityListAtIndex(int index, Function(String) updateFn) =>
      humidityList[index] = updateFn(humidityList[index]);

  List<String> tempListSTR = [];
  void addToTempListSTR(String item) => tempListSTR.add(item);
  void removeFromTempListSTR(String item) => tempListSTR.remove(item);
  void removeAtIndexFromTempListSTR(int index) => tempListSTR.removeAt(index);
  void insertAtIndexInTempListSTR(int index, String item) =>
      tempListSTR.insert(index, item);
  void updateTempListSTRAtIndex(int index, Function(String) updateFn) =>
      tempListSTR[index] = updateFn(tempListSTR[index]);

  List<String> timeListSTR = [];
  void addToTimeListSTR(String item) => timeListSTR.add(item);
  void removeFromTimeListSTR(String item) => timeListSTR.remove(item);
  void removeAtIndexFromTimeListSTR(int index) => timeListSTR.removeAt(index);
  void insertAtIndexInTimeListSTR(int index, String item) =>
      timeListSTR.insert(index, item);
  void updateTimeListSTRAtIndex(int index, Function(String) updateFn) =>
      timeListSTR[index] = updateFn(timeListSTR[index]);

  List<double> tempList = [];
  void addToTempList(double item) => tempList.add(item);
  void removeFromTempList(double item) => tempList.remove(item);
  void removeAtIndexFromTempList(int index) => tempList.removeAt(index);
  void insertAtIndexInTempList(int index, double item) =>
      tempList.insert(index, item);
  void updateTempListAtIndex(int index, Function(double) updateFn) =>
      tempList[index] = updateFn(tempList[index]);

  List<DateTime> timeList = [];
  void addToTimeList(DateTime item) => timeList.add(item);
  void removeFromTimeList(DateTime item) => timeList.remove(item);
  void removeAtIndexFromTimeList(int index) => timeList.removeAt(index);
  void insertAtIndexInTimeList(int index, DateTime item) =>
      timeList.insert(index, item);
  void updateTimeListAtIndex(int index, Function(DateTime) updateFn) =>
      timeList[index] = updateFn(timeList[index]);

  ///  State fields for stateful widgets in this component.

  InstantTimer? receivedDataTimer;
  // Stores action output result for [Custom Action - receiveData] action in DisplayReceivedData widget.
  List<String>? receivedData;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    receivedDataTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
