import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_support/src/bottom_bar.dart';
import 'package:student_support/src/sample.dart';
import 'package:student_support/src/screens/timeTable/TT_change.dart';
import 'package:student_support/src/screens/timeTable/TT_sample.dart';

List<List<String>> weekTimeTable = [
  for (int i=0;i<maxNum;i++)
    [for (int j=0;j<maxNum;j++)'']
];

@RoutePage()
class TimeTablePage extends StatefulWidget {
  const TimeTablePage({super.key});

  @override
  State<TimeTablePage> createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  
  // void getWeekTimeTable() async{
  //   final _prefs = await SharedPreferences.getInstance();
  //   if (_prefs.containsKey('timeTable')){
  //     setState(() {
  //       final jsonString = _prefs.getString("timeTable") ?? "";
  //       final decodeJson = jsonDecode(jsonString);
  //       decodeJson.asMap().forEach((i, elemList){
  //         List<String> workList = [];
  //         for (final String elem in elemList){
  //           workList.add(elem);
  //         }
  //         weekTimeTable[i] = (workList);
  //       });
  //     });
  //   }
  // }


  // @override
  // void initState(){
  //   super.initState();
  //   getWeekTimeTable();
  // }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;  // 画面のサイズを取得

    final bodyCont = Center(
      child: Column(
        children: [
          Container(
            // color: Colors.blue,
            height: screenSize.height * 0.05,
            width: screenSize.width,
            child: ElevatedButton(
              onPressed: () => Navigator.popAndPushNamed(context, "/edit"), 
              child: Text("編集モード")
            ),
          ),
          TimeTableWidget()
          
          // const BottomBar(selected: 2,)
        ],
      )
    );
    return ScreenWidget(
      titleTxt: '時間割', 
      bodyContents: bodyCont,
      drawerFlg: 1,
    );
  }
}
