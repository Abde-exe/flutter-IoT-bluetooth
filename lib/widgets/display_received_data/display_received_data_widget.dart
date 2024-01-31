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
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          _model.receivedData = await actions.receiveData(
            widget.device!,
          );
          setState(() {
            _model.addToHumidityList(_model.receivedData!.first);
            _model.addToTempListSTR(
                (double.parse(_model.receivedData!.last)).toString());
            _model.addToTimeList(getCurrentTimestamp);
            _model.addToTempList(double.parse(_model.receivedData!.last));
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
            _model.humidityList.first,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Montserrat',
                  lineHeight: 1.4,
                ),
          ),
        ),
        Flexible(
          child: Container(
            width: 404.0,
            height: 400.0,
            child: FlutterFlowLineChart(
              data: [
                FFLineChartData(
                  xData: _model.timeList,
                  yData: _model.tempList,
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
                maxY: 40.0,
              ),
              xAxisLabelInfo: AxisLabelInfo(
                title: 'Time',
                titleTextStyle: TextStyle(
                  fontSize: 14.0,
                ),
                showLabels: true,
                labelInterval: 10.0,
              ),
              yAxisLabelInfo: AxisLabelInfo(
                title: 'Temp',
                titleTextStyle: TextStyle(
                  fontSize: 14.0,
                ),
                showLabels: true,
                labelInterval: 5.0,
                labelFormatter: LabelFormatter(
                  numberFormat: (val) => val.toString(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
