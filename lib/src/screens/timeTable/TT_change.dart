import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/bottom_bar.dart';
import 'package:student_support/src/sample.dart';
import 'package:student_support/src/screens/timeTable/TT_sample.dart';

@RoutePage()
class TTChangeRouterPage extends AutoRouter {
  const TTChangeRouterPage({super.key});
}

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
        children: [
          timeTableTitle,
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

// -- 以下、部品 --

class TTElem extends StatelessWidget {
  final String txt;
  final int num;
  final dayOfWeek;
  const TTElem({super.key, required this.txt, required this.num, required this.dayOfWeek});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: numHeight,
      width: dayWidth,
      child: ElevatedButton(
        onPressed: () {
          context.router.push(AddDetailRoute(num: num, dayOfWeek: dayOfWeek));
        }, 
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
        onPressed: () => showOverlayTTChange(context), 
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
        TTElem(txt: '', num: num, dayOfWeek: '月',),
        TTElem(txt: '', num: num, dayOfWeek: '火',),
        TTElem(txt: '', num: num, dayOfWeek: '水',),
        TTElem(txt: '', num: num, dayOfWeek: '木',),
        TTElem(txt: '', num: num, dayOfWeek: '金',),
        TTElem(txt: '', num: num, dayOfWeek: '土',),
      ],
    );
  }
}

final  ttRows = [
  const WeekDay(),
  for (int i=0; i<maxNum; i++)...{
    TTRow(num: i+1),
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


