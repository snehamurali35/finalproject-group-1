import 'package:flutter/material.dart';
import 'package:neurolog/models/log_entry.dart';

class SingleEntryPage extends StatefulWidget {
  final LogEntry entry;

  const SingleEntryPage({super.key, required this.entry});

  @override
  _SingleEntryPageState createState() => _SingleEntryPageState();
}

class _SingleEntryPageState extends State<SingleEntryPage> {
  late DateTime date;
  late TimeOfDay start;
  TimeOfDay? end;
  final TextEditingController severity = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    date = widget.entry.date;
    start = TimeOfDay.fromDateTime(widget.entry.start);
    if (widget.entry.end != null) {
      end = TimeOfDay.fromDateTime(widget.entry.end!);
    }
    if (widget.entry.severity != null) {
      severity.text = widget.entry.severity.toString();
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        date = picked;
      });
    }
  }

  Future<void> _selectTime({required bool isStart}) async {
    final TimeOfDay initialTime =
        isStart ? start : end ?? TimeOfDay.now();
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          start = picked;
        } else {
          end = picked;
        }
      });
    }
  }

  String _formatTime(TimeOfDay time) {
    return '${time.hour}:${time.minute}';
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Migraine Entry')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Date Picker
            ListTile(
              title: Text('Date: ${_formatDate(date)}'),
              trailing: const Icon(Icons.calendar_today),
              onTap: _selectDate,
            ),
            // Start Time Picker
            ListTile(
              title:
                  Text('Start Time: ${_formatTime(start)}'),
              trailing: const Icon(Icons.access_time),
              onTap: () => _selectTime(isStart: true),
            ),
            // End Time Picker
            ListTile(
              title: Text(
                end == null
                    ? 'End Time: Not Set'
                    : 'End Time: ${_formatTime(end!)}',
              ),
              trailing: const Icon(Icons.access_time),
              onTap: () => _selectTime(isStart: false),
            ),
            // Severity Text Field
            TextField(
              controller: severity,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Severity (number)',
                border: OutlineInputBorder(),
              ),
            ),
            // Additional Notes
            TextField(
              controller: notesController,
              decoration: const InputDecoration(
                labelText: 'Additional Notes',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement save logic here
              },
              child: const Text('Save Entry'),
            )
          ],
        ),
      ),
    );
  }
}