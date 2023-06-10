import 'package:flutter/material.dart';
import 'package:student_support/routers/app_router.dart';
import 'package:student_support/src/screens/timeTable/timeTable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800]
      ),
      home: TimeTablePage(),
    );
  }
}
