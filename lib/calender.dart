import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'calendar_widget.dart';
import 'event_editing.dart';
import 'event_provider.dart';

class CalenderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: CalendarWidget(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.red,
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EventEditingPage())),
        ),
      );
}
