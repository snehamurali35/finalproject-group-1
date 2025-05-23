import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MigraineBarChart extends StatelessWidget {
  const MigraineBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 25,
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
              axisNameWidget: Text('Frequency '),
            ),
            bottomTitles: AxisTitles(
              axisNameWidget: Text(
                'Time of Day',
                semanticsLabel: 'Time of day',
              ),
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const days = [
                    '1am',
                    '2',
                    '3',
                    '4',
                    '5',
                    '6',
                    '7',
                    '8',
                    '9',
                    '10',
                    '11',
                    '12 pm',
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                    '6',
                    '7',
                    '8',
                    '9',
                    '10',
                    '11',
                    '12 am',
                  ];
                  final index = value.toInt();
                  return Text(
                    index >= 0 && index < days.length ? days[index] : '',
                  );
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          barGroups: generateSampleData(),
        ),
      ),
    );
  }

  List<BarChartGroupData> generateSampleData() {
    final sampleData = [
      3,
      4,
      2,
      1,
      0,
      1,
      2,
      3,
      5,
      6,
      8,
      10,
      9,
      7,
      6,
      4,
      3,
      2,
      1,
      0,
      1,
      3,
      4,
      2,
    ];

    return List.generate(sampleData.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(toY: sampleData[index].toDouble(), width: 12),
        ],
      );
    });
  }
}
