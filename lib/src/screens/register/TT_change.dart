import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

class TTChange extends StatelessWidget {
  const TTChange({super.key});

  @override
  Widget build(BuildContext context) {
    final timeTableTitle = Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      color: bgColor2,
      width: double.infinity,   // 横幅いっぱい
      child: Center(
        child: BasicText(text: '時間割１', size: 25),
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


class TTElem extends StatelessWidget {
  final String txt;
  const TTElem({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
      color: bgColor1,
      child: Center(
        child: BasicText(text: txt, size: 15),
      ),
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
        TTElem(txt: '1'),
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
    final day = Row(children: [
      BasicText(text: '', size: 15),
      BasicText(text: '月', size: 15),
      BasicText(text: '火', size: 15),
      BasicText(text: '水', size: 15),
      BasicText(text: '木', size: 15),
      BasicText(text: '金', size: 15),
      BasicText(text: '土', size: 15),
    ],);
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
      color: bgColor2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          day,
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