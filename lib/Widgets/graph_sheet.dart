// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_types_as_parameter_names, prefer_is_empty

import 'package:ethyummy/Models/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Small Compnents/sell_buy.dart';

class GraphSheet extends StatefulWidget {
  // final int High;
  // final int Low;
  const GraphSheet({
    super.key,
    // required this.High,
    // required this.Low,
  });

  @override
  State<GraphSheet> createState() => _GraphSheetState();
}

class _GraphSheetState extends State<GraphSheet> {
  late List<ChartData> data;

  @override
  void initState() {
    data = [
      ChartData(17, 1310),
      ChartData(18, 1395),
      ChartData(19, 1450),
      ChartData(20, 1393),
      ChartData(21, 1404),
      ChartData(22, 1390),
      ChartData(23, 1320),
      ChartData(24, 1370),
      ChartData(25, 1402),
      ChartData(26, 1460),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191d2d),
      body: SizedBox(
        height: 475,
        child: Column(
          children: <Widget>[
            SfCartesianChart(
              plotAreaBorderWidth: 0,
              backgroundColor: Color.fromRGBO(32, 36, 46, 0),
              borderWidth: 0,
              borderColor: Color.fromRGBO(233, 232, 232, 0),
              primaryXAxis: NumericAxis(
                  isVisible: false,
                  maximum: 17,
                  minimum: 26,
                  interval: 1,
                  borderWidth: 0,
                  borderColor: Color.fromRGBO(32, 38, 46, 2)),
              primaryYAxis: NumericAxis(
                  isVisible: false,
                  maximum: 500,
                  minimum: 1500,
                  interval: 50,
                  borderWidth: 0,
                  borderColor: Color.fromRGBO(32, 3, 46, 2)),
              series: <ChartSeries<ChartData, int>>[
                SplineAreaSeries(
                  splineType: SplineType.natural,
                  dataSource: data,
                  xValueMapper: (ChartData data, i) => data.day,
                  yValueMapper: (ChartData data, i) => data.price,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff586af8),
                      Color(0xff191d2d).withAlpha(150),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                SplineSeries(
                  markerSettings: MarkerSettings(
                      color: Colors.white,
                      isVisible: true,
                      borderColor: Colors.white,
                      borderWidth: 2,
                      shape: DataMarkerType.diamond),
                  width: 4,
                  color: Colors.white,
                  dataSource: data,
                  xValueMapper: (ChartData data, _) => data.day,
                  yValueMapper: (ChartData data, _) => data.price,
                )
              ],
            ),
            BuyAndSell()
          ],
        ),
      ),
    );
  }
}
