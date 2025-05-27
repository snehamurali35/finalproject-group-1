import 'package:flutter/material.dart';
import 'package:neurolog/models/log.dart';

class LogProvider extends ChangeNotifier {
  late final Map timeFreq;
  late Log _log;

  LogProvider(Isar isar) {
    _log = Log(isar);
  }
  Map getMappings() {
    final entries = _log.entries;
    for (var entry in entries) {
      int hour = entry.start.hour;
      if (timeFreq.containsKey(hour)) {
        timeFreq.addAll({hour: timeFreq[hour] + 1});
      } else {
        timeFreq.addAll({hour: 1});
      }
    }

    return timeFreq;
  }
}
