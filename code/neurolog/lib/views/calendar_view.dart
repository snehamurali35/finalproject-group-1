import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:calendar_view/calendar_view.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: Scaffold(
        body: MonthView(
          controller: EventController(),

          /*
          cellBuilder: (date, events, isToday, isInMonth, hideDaysNotInMonth) {
            return Container();
          },
          */
          minMonth: DateTime(2025),
          maxMonth: DateTime.now(),
          initialMonth: DateTime.now(),
          cellAspectRatio: 1,

          onCellTap: (events, date) {
            print(events);
          },
        ),
      ),
    );
  }
}
