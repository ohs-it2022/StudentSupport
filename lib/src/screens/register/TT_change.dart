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
  borderRadius: BorderRadius.circular(30),
  color: bgColor2,
);

// 画面全体のウィジェット
class TTChange extends StatelessWidget {
  const TTChange({super.key});

  @override
  Widget build(BuildContext context) {
    final timeTableTitle = Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      decoration: sectionDecoration,
      width: 200,   // 横幅いっぱい
      height: 45,
      child: Center(child: DropdownButtonMenu(),) 
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
        SizedBox(
          height: dayHeight,
          width: numWidth,
        ),
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
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          backgroundColor: bgColor1,
          padding: const EdgeInsets.all(0)
        ),
        child: BasicText(text: txt, size: 15,),
        
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
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          backgroundColor: bgColor1,
          padding: const EdgeInsets.all(0)
        ),
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
  Day(),
  for (int i=1; i<7; i++)...{
    TTRow(num: i),
  },
];

class TT extends StatelessWidget {
  const TT({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 30),
      decoration: sectionDecoration,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: ttRows
      ),
    );
  }
}

// ドロップダウンタイトル
class DropdownButtonMenu extends StatefulWidget {
  const DropdownButtonMenu({Key? key}) : super(key: key);

  @override
  State<DropdownButtonMenu> createState() => _DropdownButtonMenuState();
}

class _DropdownButtonMenuState extends State<DropdownButtonMenu> {
  String isSelectedValue = '時間割１';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: const[
        DropdownMenuItem(
          value: '時間割１',
          child: BasicText(text: '時間割１', size: 20)
        ),
        DropdownMenuItem(
          value: '時間割追加',
          child: BasicText(text: '時間割追加', size: 20)
        )
      ], 
      value: isSelectedValue,
      onChanged: (String? value) {
        setState(() {
          isSelectedValue = value!;
        });
      },
      dropdownColor: bgColor2,

    );
  }
}