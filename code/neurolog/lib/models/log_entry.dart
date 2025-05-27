class LogEntry {
  final DateTime date;
  final DateTime start;
  final int? severity;
  final DateTime? end;

  LogEntry (
    {required this.date,
    required this.start,
    this.severity,
    this.end}
  )
  
  LogEntry.withUpdatedFields (LogEntry entry, int newSeverity, DateTime newEnd)
    : date = entry.date,
      start = entry.start,
      severity = newSeverity,
      end = newEnd;
}
