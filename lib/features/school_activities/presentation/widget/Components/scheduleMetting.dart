import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';  // Import for calendar widget

class ScheduleDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Schedule Time Table"),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime(2000),
              lastDay: DateTime(2100),
              calendarFormat: CalendarFormat.month,
              headerStyle: const HeaderStyle(
                titleTextStyle: TextStyle(color: Colors.black), // Header title color
                formatButtonVisible: false, // Hide format button if not needed
                leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
                rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
                decoration: BoxDecoration(
                  color: Colors.transparent, // Header background color
                ),
              ),
              calendarStyle: const CalendarStyle(
                defaultTextStyle: TextStyle(color: Colors.black), // Default day text color
                weekendTextStyle: TextStyle(color: Colors.black), // Weekend day text color
                todayDecoration: BoxDecoration(
                  color: Colors.blueAccent, // Today cell background color
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.blue, // Selected day background color
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(color: Colors.white), // Selected day text color
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text("Close"),
        ),
      ],
    );
  }
}
