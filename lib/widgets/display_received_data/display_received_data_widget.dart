import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'display_received_data_model.dart';
export 'display_received_data_model.dart';

class DisplayReceivedDataWidget extends StatefulWidget {
  const DisplayReceivedDataWidget({
    super.key,
    this.device,
  });

  final BTDeviceStruct? device;

  @override
  State<DisplayReceivedDataWidget> createState() =>
      _DisplayReceivedDataWidgetState();
}

class _DisplayReceivedDataWidgetState extends State<DisplayReceivedDataWidget> {
  late DisplayReceivedDataModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisplayReceivedDataModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.receivedDataTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 10000),
        callback: (timer) async {
          _model.receivedData = await actions.receiveData(
            widget.device!,
          );
          setState(() {
            _model.addToHumidityListSTR(_model.receivedData!.first);
            _model.addToTempListSTR(
                (double.parse(_model.receivedData!.last)).toString());
            _model.addToTempList(double.parse(_model.receivedData!.last));
            _model.addToTimeListSTR(dateTimeFormat('Hm', getCurrentTimestamp));
            _model.addToTimeList(getCurrentTimestamp);
            _model.addToHumidityList(double.parse(_model.receivedData!.first));
          });
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Data reçues',
          style: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.of(context).primaryText,
                fontWeight: FontWeight.w600,
              ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Text(
            _model.tempListSTR.first,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Montserrat',
                  lineHeight: 1.4,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Text(
            _model.timeListSTR.first,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Montserrat',
                  lineHeight: 1.4,
                ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: FlutterFlowTheme.of(context).tertiary,
                width: 8.0,
              ),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                '${_model.tempListSTR.last} °C',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Montserrat',
                      fontSize: 43.0,
                    ),
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
            child: Container(
              width: 385.0,
              height: 400.0,
              child: Stack(
                children: [
                  FlutterFlowLineChart(
                    data: [
                      FFLineChartData(
                        xData: _model.timeList,
                        yData: _model.tempList,
                        settings: LineChartBarData(
                          color: FlutterFlowTheme.of(context).secondary,
                          barWidth: 2.0,
                          isCurved: true,
                        ),
                      )
                    ],
                    chartStylingInfo: ChartStylingInfo(
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      showGrid: true,
                      borderColor: FlutterFlowTheme.of(context).secondaryText,
                      borderWidth: 1.0,
                    ),
                    axisBounds: AxisBounds(
                      minY: 20.0,
                      maxY: 30.0,
                    ),
                    xAxisLabelInfo: AxisLabelInfo(
                      title: 'Time Live Every 1 min',
                      titleTextStyle: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    yAxisLabelInfo: AxisLabelInfo(
                      title: '\n',
                      titleTextStyle: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 0.0,
                      ),
                      showLabels: true,
                      labelTextStyle: TextStyle(
                        fontSize: 10.0,
                      ),
                      labelInterval: 0.5,
                      labelFormatter: LabelFormatter(
                        numberFormat: (val) => val.toString(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: FlutterFlowChartLegendWidget(
                      entries: [
                        LegendEntry(
                            FlutterFlowTheme.of(context).secondary, 'Temp °C'),
                      ],
                      width: 100.0,
                      height: 50.0,
                      textStyle: FlutterFlowTheme.of(context).bodyMedium,
                      textPadding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      borderWidth: 1.0,
                      borderColor: Colors.black,
                      indicatorSize: 10.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
            child: Container(
              width: 383.0,
              height: 400.0,
              child: Stack(
                children: [
                  FlutterFlowLineChart(
                    data: [
                      FFLineChartData(
                        xData: _model.timeList,
                        yData: _model.humidityList,
                        settings: LineChartBarData(
                          color: FlutterFlowTheme.of(context).primary,
                          barWidth: 2.0,
                        ),
                      )
                    ],
                    chartStylingInfo: ChartStylingInfo(
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      showGrid: true,
                      borderColor: FlutterFlowTheme.of(context).secondaryText,
                      borderWidth: 1.0,
                    ),
                    axisBounds: AxisBounds(
                      minY: 0.0,
                      maxY: 100.0,
                    ),
                    xAxisLabelInfo: AxisLabelInfo(
                      title: 'Time Live Every 1 min',
                      titleTextStyle: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    yAxisLabelInfo: AxisLabelInfo(
                      showLabels: true,
                      labelTextStyle: TextStyle(
                        fontSize: 10.0,
                      ),
                      labelInterval: 10.0,
                      labelFormatter: LabelFormatter(
                        numberFormat: (val) => val.toString(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: FlutterFlowChartLegendWidget(
                      entries: [
                        LegendEntry(
                            FlutterFlowTheme.of(context).primary, 'Humidity %'),
                      ],
                      width: 100.0,
                      height: 50.0,
                      textStyle: FlutterFlowTheme.of(context).bodyMedium,
                      textPadding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      borderWidth: 1.0,
                      borderColor: Colors.black,
                      indicatorSize: 10.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
