import 'package:flutter/material.dart';
import 'package:student_support/src/app.dart';
import 'package:student_support/src/sample.dart';
import 'package:student_support/src/screens/jinbo/TT_day.dart';
import 'package:student_support/src/screens/jinbo/TT_month.dart';
import 'package:student_support/src/screens/jinbo/TT_week.dart';
import 'package:student_support/src/screens/jinbo/unit_details.dart';
import 'package:student_support/src/screens/kinosita/attendanceInfo.dart';
import 'package:student_support/src/screens/morita/jobRegist.dart';
// import 'package:student_support/src/screens/jinbo/TT_month.dart';


void main() {
  runApp(const MyApp());
}

// 色の定義
const bgColor1 = Color.fromRGBO(28, 28, 28, 1);
const bgColor2 = Color.fromRGBO(63, 63, 63, 1);
const textColor = Colors.white;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(initialIndex: 1, length: 4, child: MyHomePage(),)
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

    return Scaffold(
      backgroundColor: bgColor1,

      appBar: AppBar(
        backgroundColor: bgColor2,
        title: Text('時間割'),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(text: '月',),
            Tab(text: '週',),
            Tab(text: '日',),
            Tab(text: '時間',),
          ],
        ),
      ),

      // オーバーレイ
      drawer: OverlayWidget(),

      
      body: const TabBarView(
        children: <Widget>[
          TTMonth(),
          TTWeek(),
          TTDay(),
          UnitDetails(),
        ],
      ),
      bottomNavigationBar: BottomMenuWidget(),
      
    );
  }
}