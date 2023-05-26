import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_support/src/bottom_bar.dart';
import 'package:student_support/src/sample.dart';
import 'package:student_support/src/screens/timeTable/TT_sample.dart';

@RoutePage()
class TimeTablePage extends StatelessWidget {
  const TimeTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;  // 画面のサイズを取得
    final contentsWidth = screenSize.width * 0.95;
    // final timeTableTitle = Container(
    //   margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
    //   decoration: sectionDecoration,
    //   width: contentsWidth,
    //   height: 45,
    //   child: const Center(child: DropdownButtonMenu(menuElem: ['時間割１','時間割２','時間割追加']),)
    // );
    final timeTable = _TT(width: contentsWidth);

    final bodyCont = Center(
      child: Column(
        children: [
          // timeTableTitle,
          Expanded(child: timeTable),
          BottomBar(selected: 2,)
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

class _TT extends StatelessWidget {
  final double width;
  const _TT({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
      width: width,
      alignment: Alignment.center,
      decoration: sectionDecoration,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _ttRows
      ),
    );
  }
}

final  _ttRows = [
  const WeekDay(),
  for (int i=0; i<maxNum; i++)...{
    _TTRow(num: i+1),
  },
];

class _TTRow extends StatelessWidget {
  final int num;
  const _TTRow({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _TTNum(txt: '$num'),
        for (int dayOfWeek=0;dayOfWeek<6;dayOfWeek++)
          _TTElem(txt: '', num: num, dayOfWeek: dayOfWeek),
      ],
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


var weekTimeTable = [
  for (int i=0;i<maxNum;i++)
    [for (int j=0;j<maxNum;j++) '']
];
class _TTElem extends StatefulWidget {
  final String txt;
  final int num;
  final dayOfWeek;
  const _TTElem({super.key, required this.txt, required this.num, required this.dayOfWeek});

  @override
  State<_TTElem> createState() => __TTElemState();
}

class __TTElemState extends State<_TTElem> {
  void getDayTimeTable(weekday) async{
    final _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('timeTable')){
      setState(() {
        final jsonString = _prefs.getString("timeTable") ?? "";
        final decodeJson = jsonDecode(jsonString);
        weekTimeTable = decodeJson.cast<String>() as List<List<String>>;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: numHeight,
      width: dayWidth,
      child: ElevatedButton(
        onPressed: () {
          
        }, 
        style: btnStyle,
        child: BasicText(text: weekTimeTable[widget.dayOfWeek][widget.num], size: 15,)
      ),
    );
  }
}