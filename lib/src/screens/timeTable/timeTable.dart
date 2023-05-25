import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
          BottomBar()
        ],
      )
    );
    return ScreenWidget(
      titleTxt: '時間割変更', 
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
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
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
        _TTElem(txt: '', num: num, dayOfWeek: '月',),
        _TTElem(txt: '', num: num, dayOfWeek: '火',),
        _TTElem(txt: '', num: num, dayOfWeek: '水',),
        _TTElem(txt: '', num: num, dayOfWeek: '木',),
        _TTElem(txt: '', num: num, dayOfWeek: '金',),
        _TTElem(txt: '', num: num, dayOfWeek: '土',),
      ],
    );
  }
}


class _TTNum extends StatelessWidget {
  final String txt;
  const _TTNum({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: numHeight,
      width: numWidth,
      child: Text(txt)
    );
  }
}


class _TTElem extends StatelessWidget {
  final String txt;
  final int num;
  final dayOfWeek;
  const _TTElem({super.key, required this.txt, required this.num, required this.dayOfWeek});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: numHeight,
      width: dayWidth,
      child: ElevatedButton(
        onPressed: () {
          
        }, 
        style: btnStyle,
        child: BasicText(text: txt, size: 15,)
      ),
    );
  }
}