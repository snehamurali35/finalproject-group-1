class LogEntry {
  final DateTime date;
  final DateTime start;
  final int? severity;
  final DateTime? end;

  LogEntry({required this.date, required this.start, this.severity, this.end});
  // TODO: implement E

  LogEntry.withUpdatedText(LogEntry entry, newSeverity, DateTime newEnd)
    : date = entry.date,
      start = entry.start,
      severity = newSeverity,
      end = newEnd;
}
