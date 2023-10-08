import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavy_metals/Getx/HomeCtx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DemographyScreen extends StatelessWidget {
  DemographyScreen({super.key});
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ...List.generate(
                _homeController.metals.length,
                (index) => SfCircularChart(
                  title: ChartTitle(text: _homeController.metals[index].text),
                  legend:
                      const Legend(overflowMode: LegendItemOverflowMode.wrap),
                  series: _getRadiusPieSeries(_homeController.metals[index]),
                  tooltipBehavior: TooltipBehavior(enable: true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieSeries<ChartSampleData, String>> _getRadiusPieSeries(element) {
    print(element);
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'Argentina', y: 505370, text: '45%'),
            ChartSampleData(x: 'Belgium', y: 551500, text: '53.7%'),
            ChartSampleData(x: 'Cuba', y: 312685, text: '59.6%'),
            ChartSampleData(x: 'Dominican Republic', y: 350000, text: '72.5%'),
            ChartSampleData(x: 'Egypt', y: 301000, text: '85.8%'),
            ChartSampleData(x: 'Kazakhstan', y: 300000, text: '90.5%'),
            ChartSampleData(x: 'Somalia', y: 357022, text: '95.6%')
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

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class ChartSampleData {
  ChartSampleData({this.x, this.y, this.text, this.pointColor});
  final String? x;
  final int? y;
  final String? text;
  final Color? pointColor;
}
