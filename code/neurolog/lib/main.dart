import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:neurolog/views/navigation_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: NavigationView())),
    );
  }
}
