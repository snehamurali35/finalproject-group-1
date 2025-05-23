import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:neurolog/views/graph.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Migraine Frequency by Time of Day',
      home: Scaffold(
        appBar: AppBar(title: const Text('Migraine Frequency by Time of Day')),
        body: Center(child: MigraineBarChart()),
      ),
    );
  }
}
