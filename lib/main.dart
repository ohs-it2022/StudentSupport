import 'package:flutter/material.dart';
import 'package:student_support/src/app.dart';
import 'package:student_support/src/sample.dart';
import 'package:student_support/src/screens/attend/attendanceInfo.dart';
import 'package:student_support/src/screens/register/TT_change.dart';
import 'package:student_support/src/screens/register/taskRegist.dart';
import 'package:student_support/src/screens/settings/settings.dart';
import 'package:student_support/src/screens/time_table/TT_day.dart';
import 'package:student_support/src/screens/time_table/TT_month.dart';
import 'package:student_support/src/screens/time_table/TT_week.dart';
import 'package:student_support/src/screens/time_table/unit_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // -- ボトムメニューの画面遷移用 --
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/attendInfo': (context) => const AttendanceInfoPage(),
        '/taskRegist': (context) => const TaskRegist(),
        '/TTChange': (context) => const TTChange(),
        '/Settings': (context) => const Settings()
      },
      // -------------------------------
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // 画面遷移のアニメーション設定
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
          },
        )
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      initialIndex: 1, 
      length: 4, 
      child: Scaffold(
        backgroundColor: bgColor1,

        appBar: AppBar(
          backgroundColor: bgColor2,
          title: const BasicText(text: '時間割', size: appBarTextSize),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: '月',),
              Tab(text: '週',),
              Tab(text: '日',),
              Tab(text: '時間',),
            ],
          ),
        ),

        // オーバーレイ
        drawer: const OverlayWidget(),

        
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),   // 横スクロール禁止
          children: <Widget>[
            TTMonth(),
            TTWeek(),
            TTDay(),
            UnitDetails(),
          ],
        ),
        bottomNavigationBar: const BottomMenuWidget(),
      )
    );
  }
}