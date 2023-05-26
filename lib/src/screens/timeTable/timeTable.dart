import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_support/src/bottom_bar.dart';
import 'package:student_support/src/sample.dart';
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
  
  void getWeekTimeTable() async{
    final _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('timeTable')){
      setState(() {
        final jsonString = _prefs.getString("timeTable") ?? "";
        final decodeJson = jsonDecode(jsonString);
        decodeJson.asMap().forEach((i, elemList){
          List<String> workList = [];
          for (final String elem in elemList){
            workList.add(elem);
          }
          weekTimeTable[i] = (workList);
        });
      });
    }
  }


  @override
  void initState(){
    super.initState();
    getWeekTimeTable();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;  // 画面のサイズを取得
    final contentsWidth = screenSize.width * 0.95;

    final bodyCont = Center(
      child: Column(
        children: [
          // timeTableTitle,
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              width: contentsWidth,
              alignment: Alignment.center,
              decoration: sectionDecoration,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const WeekDay(),
                  for (int i=0; i<maxNum; i++)...{
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _TTNum(txt: '${i+1}'),
                        for (int dayOfWeek=0;dayOfWeek<6;dayOfWeek++)
                          _TTElem(txt: weekTimeTable[dayOfWeek][i], num: i, dayOfWeek: dayOfWeek),
                      ],
                    ),
                  },
                ],
              ),
            ),
          ),
          const BottomBar(selected: 2,)
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

class _TTNum extends StatelessWidget {
  final String txt;
  const _TTNum({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: numHeight,
      width: numWidth,
      decoration: elemDecoration,
      child: Center(child: Text(txt))
    );
  }
}

class _TTElem extends StatefulWidget {
  final String txt;
  final int num;
  final dayOfWeek;
  const _TTElem({super.key, required this.txt, required this.num, required this.dayOfWeek});

  @override
  State<_TTElem> createState() => __TTElemState();
}

class __TTElemState extends State<_TTElem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: numHeight,
      width: dayWidth,
      child: ElevatedButton(
        onPressed: () {
          
        }, 
        style: btnStyle,
        child: BasicText(text: widget.txt, size: 15,)
      ),
    );
  }
}