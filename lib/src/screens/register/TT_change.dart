import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

const double dayHeight = 27;  // 曜日の要素の高さ
const double dayWidth = 50;   // 曜日の要素の横幅
const double numHeight = 60;  // 時間の要素の高さ
const double numWidth = 20;   // 時間の要素の横幅

final elemDecoration = BoxDecoration(
  color: bgColor1,
  borderRadius: BorderRadius.circular(10)
);

final sectionDecoration = BoxDecoration(
  color: bgColor2,
  borderRadius: BorderRadius.circular(30),
);

// 画面全体のウィジェット
@RoutePage()
class TTChangePage extends StatelessWidget {
  const TTChangePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;  // 画面のサイズを取得
    final contentsWidth = screenSize.width * 0.95;
    final timeTableTitle = Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      decoration: sectionDecoration,
      width: contentsWidth,
      height: 45,
      child: const Center(child: DropdownButtonMenu(menuElem: ['時間割１','時間割２','時間割追加']),)
    );
    final timeTable = TT(width: contentsWidth);

    final bodyCont = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          timeTableTitle,
          Expanded(child: timeTable)    // 縦いっぱい
        ],
      )
    );
    return ScreenWidget(
      titleTxt: '時間割変更', 
      bodyContents: bodyCont,
    );
  }
}

// -- 以下、部品 --

class DayElem extends StatelessWidget {
  final String txt;
  const DayElem({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dayHeight,
      width: dayWidth,
      decoration: elemDecoration,
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
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(height: dayHeight, width: numWidth),
        DayElem(txt: '月'),
        DayElem(txt: '火'),
        DayElem(txt: '水'),
        DayElem(txt: '木'),
        DayElem(txt: '金'),
        DayElem(txt: '土'),   // 土曜日を表示するか、設定できるようにするかも
      ],
    );
  }
}

final btnStyle = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)
  ),
  backgroundColor: bgColor1,
  padding: const EdgeInsets.all(0)
);

class TTElem extends StatelessWidget {
  final String txt;
  const TTElem({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: numHeight,
      width: dayWidth,
      child: ElevatedButton(
        onPressed: (){}, 
        style: btnStyle,
        child: BasicText(text: txt, size: 15,)
      ),
    );
  }
}

class TTNum extends StatelessWidget {
  final String txt;
  const TTNum({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: numHeight,
      width: numWidth,
      child: ElevatedButton(
        onPressed: (){}, 
        style: btnStyle,
        child: BasicText(text: txt, size: 15,),
      ),
    );
  }
}

class TTRow extends StatelessWidget {
  final int num;
  const TTRow({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TTNum(txt: '$num'),
        TTElem(txt: ''),
        TTElem(txt: '',),
        TTElem(txt: '',),
        TTElem(txt: '',),
        TTElem(txt: '',),
        TTElem(txt: '',),
      ],
    );
  }
}

final  ttRows = [
  const Day(),
  for (int i=1; i<7; i++)...{
    TTRow(num: i),
  },
];

class TT extends StatelessWidget {
  final double width;
  const TT({super.key, required this.width});

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
        children: ttRows
      ),
    );
  }
}

class TimeSettings extends StatelessWidget {
  const TimeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor1,
    );
  }
}

