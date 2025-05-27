import 'package:neurolog/models/log_entry.dart';
import 'package:isar/isar.dart';

class Log {
  final Isar _isar;

  // The field _entries keeps track of the list of all journal entries.
  late final List<LogEntry> _entries;
  late final Map _graphData;
  Log(Isar isar)
    : _entries = isar.journalEntrys.where().findAllSync(),
      _isar = isar;

  List<LogEntry> get entries {
    return List.from(_entries);
  }
}
