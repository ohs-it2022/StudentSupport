import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:student_support/src/screens/timeTable/TT_change.dart';
import 'package:student_support/src/screens/timeTable/timeTable.dart';
import 'package:student_support/src/themeSettings/theme_consts.dart';
import 'package:student_support/src/screens/timeTable/TT_sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MyAppPage(context: context);
  }
}

class MyAppPage extends StatefulWidget {
  const MyAppPage({super.key, required context});

  @override
  State<StatefulWidget> createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     updateList();
  //   });
  //   print("Finish");
  // }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudentSupport',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      initialRoute: "/",
      routes: {
        '/': (context) => const TimeTablePage(),
        '/edit': (context) => const TTChangePage(),
      },
    );
  }
}
