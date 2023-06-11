import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';
import 'package:student_support/src/screens/timeTable/TT_change.dart';
import 'package:student_support/src/screens/timeTable/form.dart';

class TimeTableWidget extends StatelessWidget {
  final mode;
  const TimeTableWidget({super.key, this.mode="browse"});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;  // 画面のサイズを取得
    final contentsWidth = screenSize.width * 0.95;
    return Container(
      margin: EdgeInsets.fromLTRB(0, screenSize.height * 0.025, 0, 0),
      width: contentsWidth,
      height: screenSize.height * 0.75,
      alignment: Alignment.center,
      decoration: sectionDecoration,
      padding: EdgeInsets.fromLTRB(0, screenSize.height * 0.025, 0, screenSize.height * 0.025),
      child: SizedBox(
        width: screenSize.width * 0.9,
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
                    _TTElem(txt: testTimeTable[dayOfWeek][i], num: i, dayOfWeek: dayOfWeek, mode: mode),
                ],
              ),
            },
          ],
        ),
      )
    );
  }
}


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


class _TTNum extends StatelessWidget {
  final String txt;
  const _TTNum({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;  // 画面のサイズを取得
    return Container(
      height: screenSize.height * numHeight,
      width: screenSize.width * numWidth,
      decoration: elemDecoration,
      child: Center(child: Text(txt))
    );
  }
}

class _TTElem extends StatefulWidget {
  final String txt;
  final int num;
  final dayOfWeek;
  final mode;
  const _TTElem({super.key, required this.txt, required this.num, required this.dayOfWeek, required this.mode});

  @override
  State<_TTElem> createState() => __TTElemState();
}

class __TTElemState extends State<_TTElem> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;  // 画面のサイズを取得
    return SizedBox(
      height: screenSize.height * numHeight,
      width: screenSize.width * dayWidth,
      child: ElevatedButton(
        onPressed: () {
          if (widget.mode=="browse"){
            showOverlayTT(context);
          }else if(widget.mode=="edit"){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => FormPage(num: widget.num, dayOfWeek: widget.dayOfWeek, weekTimeTable: testTimeTable))
            );
          }
          
        }, 
        style: btnStyle,
        child: BasicText(text: widget.txt, size: 15,)
      ),
    );
  }
}
// オーバーレイ
OverlayEntry overlayEntryTT = OverlayEntry(
  builder: (BuildContext context) {
    return BottomOverlay(
      height: 0.6, 
      content: TTOverlay(), 
      hideFunc: hideOverlayTT
    );
  }
);

void showOverlayTT(BuildContext context){
  Overlay.of(context).insert(overlayEntryTT);
}
void hideOverlayTT() {
  overlayEntryTT.remove();
}

class TTOverlay extends StatefulWidget {
  const TTOverlay({super.key});

  @override
  State<TTOverlay> createState() => _TTOverlayState();
}

class _TTOverlayState extends State<TTOverlay> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('AA'),);
  }
}