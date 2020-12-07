import 'package:flutter/material.dart';
import 'package:good_air/helpers/color_aqi.dart';
import 'package:good_air/sqlite/entities/info_feed_story.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphPage extends StatefulWidget {
  List<InfoFeedStoryEntity> infoFeed;

  GraphPage(List<InfoFeedStoryEntity> infoFeed) {
    this.infoFeed = infoFeed;
  }

  State<GraphPage> createState() {
    return GraphPageState(infoFeed);
  }
}

class GraphPageState extends State<GraphPage> {
  List<InfoFeedStoryEntity> infoFeed;

  GraphPageState(List<InfoFeedStoryEntity> infoFeed) {
    this.infoFeed = infoFeed;
  }

  Widget build(BuildContext context) {
    return SfCircularChart(
      //tooltipBehavior: TooltipBehavior(enable: true),
      legend: Legend(
          isVisible: true,
          isResponsive: true,
          overflowMode: LegendItemOverflowMode.wrap,
          title: LegendTitle(text: 'Legend', alignment: ChartAlignment.center)),
      series: _getLegendDefaultSeries(),
    );
  }

  List<PieSeries<ChartSampleData, String>> _getLegendDefaultSeries() {
    int count = 1;
    var goodList =
        infoFeed.where((element) => getColorAqiNumber(element.aqi) == 0);
    var moderateList =
        infoFeed.where((element) => getColorAqiNumber(element.aqi) == 1);
    var unhealthy1List =
        infoFeed.where((element) => getColorAqiNumber(element.aqi) == 2);
    var unhealthy2List =
        infoFeed.where((element) => getColorAqiNumber(element.aqi) == 3);
    var unhealthy3List =
        infoFeed.where((element) => getColorAqiNumber(element.aqi) == 4);
    var hazardousList =
        infoFeed.where((element) => getColorAqiNumber(element.aqi) == 5);
    if (infoFeed.length > 0) {
      count = infoFeed.length;
    }
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData('Good', (goodList.length * 100) ~/ count, 25),
      ChartSampleData('Moderate', (moderateList.length * 100) ~/ count, 75),
      ChartSampleData('Unhealthy for Sensitive Groups',
          (unhealthy1List.length * 100) ~/ count, 125),
      ChartSampleData('Unhealthy', (unhealthy2List.length * 100) ~/ count, 175),
      ChartSampleData(
          'Very Unhealthy', (unhealthy3List.length * 100) ~/ count, 250),
      ChartSampleData('Hazardous', (hazardousList.length * 100) ~/ count, 350),
    ];

    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData data, _) => data.name,
          yValueMapper: (ChartSampleData data, _) => data.percentage,
          explode: true,
          explodeAll: true,
          enableSmartLabels: true,
          pointColorMapper: (ChartSampleData data, _) =>
              getColorAqi(data.value.toInt()),
          animationDuration: 1000,
          dataLabelSettings: DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
              connectorLineSettings: ConnectorLineSettings(
                  // Type of the connector line
                  type: ConnectorType.curve))),
    ];
  }
}

class ChartSampleData {
  int percentage;
  String name;
  int value;
  ChartSampleData(String name, int percentage, int value) {
    this.name = name;
    this.percentage = percentage;
    this.value = value;
  }
}
