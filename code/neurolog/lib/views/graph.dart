import 'package:provider/provider.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:neurolog/models/log.dart';
import 'package:neurolog/providers/log_provider.dart';

class MigraineBarChart extends StatelessWidget {
  const MigraineBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Consumer<LogProvider>(
            builder: (context, provider, child) {
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
                              index >= 0 && index < days.length
                                  ? days[index]
                                  : '',
                            );
                          },
                        ),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),

                    barGroups: convertMapToBarGroups(provider.getMappings()),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> convertMapToBarGroups(Map<int, int> migData) {
    return migData.entries.map((entry) {
      return BarChartGroupData(
        x: entry.key,
        barRods: [BarChartRodData(toY: entry.value.toDouble(), width: 20)],
      );
    }).toList();
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
