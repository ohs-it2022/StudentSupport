import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/sample.dart';
import 'package:table_calendar/table_calendar.dart';

final _focusedDay = today;
DateTime? _selected;
CalendarFormat _calendarFormat = CalendarFormat.month;

@RoutePage()
class HomeMonthPage extends StatefulWidget {
  const HomeMonthPage({super.key});

  @override
  State<HomeMonthPage> createState() => _HomeMonthPageState();
}

class _HomeMonthPageState extends State<HomeMonthPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TableCalendar(
        firstDay: DateTime.utc(2023, 4, 1),
        lastDay: DateTime.utc(2024, 3, 31),
        selectedDayPredicate: (day) {
          return isSameDay(_selected, day);
        },
        calendarFormat: _calendarFormat,
        onDaySelected: (selected, focused) {
          // if (!isSameDay(_selected, selected)) {
          //   setState(() {
          //     _selected = selected;
          //     _focusedDay = focused;
          //   });
          // }
          AutoRouter.of(context).push(HomeDayRoute(month: selected.month, day: selected.day, weekday: selected.weekday));  // 変更が必要
          print(selected.day);
          print(focused);
        },
        onFormatChanged: (format){
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        focusedDay: _focusedDay,
      ),
    );
    
  }
}