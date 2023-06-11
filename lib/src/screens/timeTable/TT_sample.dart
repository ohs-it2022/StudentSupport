import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

const double dayHeight = 0.038125;  // 曜日の要素の高さ
const double dayWidth = 0.12656;   // 曜日の要素の横幅
const double numHeight = 0.0953125;  // 時間の要素の高さ
const double numWidth = 0.050625;   // 時間の要素の横幅

final elemDecoration = BoxDecoration(
  color: bgColor1,
  borderRadius: BorderRadius.circular(10)
);

final sectionDecoration = BoxDecoration(
  color: bgColor2,
  borderRadius: BorderRadius.circular(30),
);


class DayElem extends StatelessWidget {
  final String txt;
  const DayElem({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;  // 画面のサイズを取得
    return Container(
      height: screenSize.height * dayHeight,
      width: screenSize.width * dayWidth,
      decoration: elemDecoration,
      child: Center(
        child: BasicText(text: txt, size: 15),
      ),
    );
  }
}

class WeekDay extends StatelessWidget {
  const WeekDay({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;  // 画面のサイズを取得
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(height: screenSize.height * dayHeight, width: screenSize.width * numWidth),
        const DayElem(txt: '月'),
        const DayElem(txt: '火'),
        const DayElem(txt: '水'),
        const DayElem(txt: '木'),
        const DayElem(txt: '金'),
        const DayElem(txt: '土'),   // 土曜日を表示するか、設定できるようにするかも
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