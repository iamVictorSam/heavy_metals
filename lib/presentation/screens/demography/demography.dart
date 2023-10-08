import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DemographyScreen extends StatelessWidget {
  const DemographyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // SfCircularChart(
              //   key: GlobalKey(),
              //   title: ChartTitle(text: 'Khana'),
              //   series: _getRadialBarDefaultSeries(),
              //   // tooltipBehavior: _tooltipBehavior,
              // ),
              SfCircularChart(
                title: ChartTitle(
                    text: 'Various countries population density and area'),
                legend: const Legend(overflowMode: LegendItemOverflowMode.wrap),
                series: _getRadiusPieSeries(),
                // onTooltipRender: (TooltipArgs args) {
                //   final NumberFormat format = NumberFormat.decimalPattern();
                //   args.text = args.dataPoints![args.pointIndex!.toInt()].x.toString() +
                //       ' : ' +
                //       format.format(args.dataPoints![args.pointIndex!.toInt()].y);
                // },
                tooltipBehavior: TooltipBehavior(enable: true),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieSeries<ChartSampleData, String>> _getRadiusPieSeries() {
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

  List<RadialBarSeries<ChartSampleData, String>> _getRadialBarDefaultSeries() {
    return <RadialBarSeries<ChartSampleData, String>>[
      RadialBarSeries<ChartSampleData, String>(
          maximumValue: 15,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10.0)),
          dataSource: <ChartSampleData>[
            ChartSampleData(
                x: 'John',
                y: 10,
                text: '100%',
                pointColor: const Color.fromRGBO(248, 177, 149, 1.0)),
            ChartSampleData(
                x: 'Almaida',
                y: 11,
                text: '100%',
                pointColor: const Color.fromRGBO(246, 114, 128, 1.0)),
            ChartSampleData(
                x: 'Don',
                y: 12,
                text: '100%',
                pointColor: const Color.fromRGBO(61, 205, 171, 1.0)),
            ChartSampleData(
                x: 'Tom',
                y: 13,
                text: '100%',
                pointColor: const Color.fromRGBO(1, 174, 190, 1.0)),
          ],
          cornerStyle: CornerStyle.bothCurve,
          gap: '10%',
          radius: '90%',
          xValueMapper: (ChartSampleData data, _) => data.x,
          yValueMapper: (ChartSampleData data, _) => data.y,
          pointRadiusMapper: (ChartSampleData data, _) => data.text,
          pointColorMapper: (ChartSampleData data, _) => data.pointColor,
          dataLabelMapper: (ChartSampleData data, _) => data.x)
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
