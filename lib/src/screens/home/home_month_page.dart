import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/bottom_bar.dart';
import 'package:student_support/src/sample.dart';

import 'package:table_calendar/table_calendar.dart';

DateTime _focusedDay = DateTime.now();
DateTime? _selected;

@RoutePage()
class HomeMonthPage extends StatefulWidget {
  const HomeMonthPage({super.key});

  @override
  State<HomeMonthPage> createState() => _HomeMonthPageState();
}

class _HomeMonthPageState extends State<HomeMonthPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: TableCalendar(
              firstDay: DateTime.utc(2023, 4, 1),
              lastDay: DateTime.utc(2024, 3, 31),
              selectedDayPredicate: (day) {
                    return isSameDay(_selected, day);
                  },
                  onDaySelected: (selected, focused) {
                    if (!isSameDay(_selected, selected)) {
                      setState(() {
                        _selected = selected;
                        _focusedDay = focused;
                      });
                    }
                  },
              focusedDay: _focusedDay,
            ),
          ),
        ),
        BottomBar()
      ],
    );
    
  }
}