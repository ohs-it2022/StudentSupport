import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

const double dayHeight = 30;  // 曜日の要素の高さ
const double dayWidth = 50;   // 曜日の要素の横幅
const double numHeight = 60;  // 時間の要素の高さ
const double numWidth = 20;   // 時間の要素の横幅

class TTChange extends StatelessWidget {
  const TTChange({super.key});

  @override
  Widget build(BuildContext context) {
    final timeTableTitle = Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: bgColor2,
      ),
      width: double.infinity,   // 横幅いっぱい
      height: 50,
      child: Center(
        child: BasicText(text: '時間割１', size: 20),
      )
    );
    final timeTable = TT();

    final bodyCont = Column(
        children: [
          timeTableTitle,
          Expanded(child: timeTable)    // 縦いっぱい
        ],
    );
    return ScreenWidget(
      titleTxt: '時間割変更', 
      bodyContents: bodyCont,
    );
  }
}


class DayElem extends StatelessWidget {
  final String txt;
  const DayElem({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dayHeight,
      width: dayWidth,
      decoration: BoxDecoration(
        color: bgColor1,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: BasicText(text: txt, size: 15),
      ),
    );
  }
}


class Day extends StatelessWidget {
  const Day({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: dayHeight,
          width: numWidth,
        ),
        DayElem(txt: '月'),
        DayElem(txt: '火'),
        DayElem(txt: '水'),
        DayElem(txt: '木'),
        DayElem(txt: '金'),
        DayElem(txt: '土'),
      ],
    );
  }
}

class TTElem extends StatelessWidget {
  final String txt;
  const TTElem({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: numHeight,
      width: dayWidth,
      decoration: BoxDecoration(
        color: bgColor1,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: BasicText(text: txt, size: 15),
      ),
    );
  }
}

class TTNum extends StatelessWidget {
  final String txt;
  const TTNum({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: numHeight,
      width: numWidth,
      decoration: BoxDecoration(
        color: bgColor1,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: BasicText(text: txt, size: 15,),)
    );
  }
}

class TTRow extends StatelessWidget {
  const TTRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TTNum(txt: '1'),
        TTElem(txt: 'CS11'),
        TTElem(txt: 'CS11',),
        TTElem(txt: 'CS11',),
        TTElem(txt: 'CS11',),
        TTElem(txt: 'CS11',),
        TTElem(txt: 'CS11',),
      ],
    );
  }
}

class TT extends StatelessWidget {
  const TT({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: bgColor2,
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Day(),
          TTRow(),
          TTRow(),
          TTRow(),
          TTRow(),
          TTRow(),
          TTRow(),
        ],
      ),
    );
  }
}