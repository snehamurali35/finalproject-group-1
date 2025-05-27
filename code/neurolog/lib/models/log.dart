import 'package:neurolog/models/log_entry.dart';

class Log {
  // The field _entries keeps track of the list of all journal entries.
  late final List<LogEntry> _entries;

  late final Map timeFreq;

  List<LogEntry> get entries {
    return List.from(_entries);
  }
}
