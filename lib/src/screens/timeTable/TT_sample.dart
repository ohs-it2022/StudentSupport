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

class WeekDay extends StatelessWidget {
  const WeekDay({super.key});

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