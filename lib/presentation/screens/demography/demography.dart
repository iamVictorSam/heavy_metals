import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavy_metals/Getx/HomeCtx.dart';
import 'package:heavy_metals/models/model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DemographyScreen extends StatelessWidget {
  DemographyScreen({super.key});
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demography'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _homeController.metals.length,
          itemBuilder: (BuildContext context, int index) => SfCircularChart(
            title: ChartTitle(
                text: _homeController.metals[index].text,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
            legend: const Legend(overflowMode: LegendItemOverflowMode.wrap),
            series: _getRadiusPieSeries1(_homeController.metals[index]),
            tooltipBehavior: TooltipBehavior(enable: true),
          ),
        ),
      ),
    );
  }

  List<PieSeries<ChartSampleData, String>> _getRadiusPieSeries1(
      MetalsModel metal) {
    // Calculate the total for all metals at this location
    double total = double.parse(metal.cd) +
        double.parse(metal.pb) +
        double.parse(metal.ni) +
        double.parse(metal.hg) +
        double.parse(metal.cr) +
        double.parse(metal.zn);

    // Calculate the percentage for each metal
    double cdPercentage = (double.parse(metal.cd) / total) * 100;
    double pbPercentage = (double.parse(metal.pb) / total) * 100;
    double niPercentage = (double.parse(metal.ni) / total) * 100;
    double hgPercentage = (double.parse(metal.hg) / total) * 100;
    double crPercentage = (double.parse(metal.cr) / total) * 100;
    double znPercentage = (double.parse(metal.zn) / total) * 100;

    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(
              x: 'Cd',
              y: cdPercentage,
              text: '${cdPercentage.toStringAsFixed(2)}%'),
          ChartSampleData(
              x: 'Pb',
              y: pbPercentage,
              text: '${pbPercentage.toStringAsFixed(2)}%'),
          ChartSampleData(
              x: 'Ni',
              y: niPercentage,
              text: '${niPercentage.toStringAsFixed(2)}%'),
          ChartSampleData(
              x: 'Hg',
              y: hgPercentage,
              text: '${hgPercentage.toStringAsFixed(2)}%'),
          ChartSampleData(
              x: 'Cr',
              y: crPercentage,
              text: '${crPercentage.toStringAsFixed(2)}%'),
          ChartSampleData(
              x: 'Zn',
              y: znPercentage,
              text: '${znPercentage.toStringAsFixed(2)}%'),
        ],
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
        dataLabelMapper: (ChartSampleData data, _) => data.text,
        startAngle: 100,
        endAngle: 100,
        pointRadiusMapper: (ChartSampleData data, _) => data.text,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          labelPosition: ChartDataLabelPosition.outside,
        ),
      ),
    ];
  }

  List<PieSeries<ChartSampleData, String>> _getRadiusPieSeries(
      MetalsModel metal) {
    double total = double.parse(metal.cd) +
        double.parse(metal.pb) +
        double.parse(metal.ni) +
        double.parse(metal.hg) +
        double.parse(metal.cr) +
        double.parse(metal.zn);

    // Calculate the percentage for each metal
    double cdPercentage = (double.parse(metal.cd) / total) * 100;
    double pbPercentage = (double.parse(metal.pb) / total) * 100;
    double niPercentage = (double.parse(metal.ni) / total) * 100;
    double hgPercentage = (double.parse(metal.hg) / total) * 100;
    double crPercentage = (double.parse(metal.cr) / total) * 100;
    double znPercentage = (double.parse(metal.zn) / total) * 100;

    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          dataSource: <ChartSampleData>[
            ChartSampleData(
                x: 'Cd',
                y: cdPercentage,
                text: '${cdPercentage.toStringAsFixed(2)}%'),
            ChartSampleData(
                x: 'Pb',
                y: pbPercentage,
                text: '${pbPercentage.toStringAsFixed(2)}%'),
            ChartSampleData(
                x: 'Ni',
                y: niPercentage,
                text: '${niPercentage.toStringAsFixed(2)}%'),
            ChartSampleData(
                x: 'Hg',
                y: hgPercentage,
                text: '${hgPercentage.toStringAsFixed(2)}%'),
            ChartSampleData(
                x: 'Cr',
                y: crPercentage,
                text: '${crPercentage.toStringAsFixed(2)}%'),
            ChartSampleData(
                x: 'Zn',
                y: znPercentage,
                text: '${znPercentage.toStringAsFixed(2)}%'),
          ],
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.x as String,
          startAngle: 100,
          endAngle: 100,
          pointRadiusMapper: (ChartSampleData data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, labelPosition: ChartDataLabelPosition.outside))
    ];
  }
}

class ChartSampleData {
  ChartSampleData({this.x, this.y, this.text, this.pointColor});
  final String? x;
  final double? y;
  final String? text;
  final Color? pointColor;
}
