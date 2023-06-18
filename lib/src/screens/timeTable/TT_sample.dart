import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';
import 'package:student_support/src/screens/timeTable/TT_change.dart';
import 'package:student_support/src/screens/timeTable/form.dart';
import 'package:student_support/src/time_table_model.dart';

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
      height: screenSize.height * 0.7,
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
                    _TTElem(txt: testTimeTable[dayOfWeek][i], time: i, dayOfWeek: dayOfWeek, mode: mode),
                ],
              ),
            },
          ],
        ),
      )
    );
  }
}


const double dayHeight  = 0.03;  // 曜日の要素の高さ
const double dayWidth   = 0.13;  // 曜日の要素の横幅
const double numHeight  = 0.09;  // 時間の要素の高さ
const double numWidth   = 0.05;  // 時間の要素の横幅

final elemDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10)
);

final sectionDecoration = BoxDecoration(
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
        // screenSize.width/27
        child: Text(txt),
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
      child: Center(child: Text(txt, style: TextStyle(fontSize: screenSize.width/27),))
    );
  }
}

class _TTElem extends StatefulWidget {
  final String txt;
  final int time;
  final dayOfWeek;
  final mode;
  const _TTElem({super.key, required this.txt, required this.time, required this.dayOfWeek, required this.mode});

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
        onPressed: () async {
          if (widget.mode=="browse"){
            // TODO: オーバーレイがこの状態だと表示されない
            FutureBuilder(
              future: getSubject(0, widget.dayOfWeek, widget.time),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  showOverlayTT(context, snapshot.data!);
                } else if (snapshot.hasError) {
                  showError(context, const Text("予期しないエラーが発生しました。"));
                } else {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => const Center(child: CircularProgressIndicator())
                  );
                }
                return const Text("");
              },
            );
          }else if(widget.mode=="edit"){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => FormPage(num: widget.time, dayOfWeek: widget.dayOfWeek, weekTimeTable: testTimeTable))
            );
          }
        }, 
        style: btnStyle,
        child: Text(widget.txt,style: TextStyle(fontSize: screenSize.width/30),)
      ),
    );
  }
}

Future showError(context, Widget? content) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("エラー"),
          content: content,
          actions: [
            TextButton(onPressed:() {}, child: const Text("OK"))
          ],
        );
      }
  );
}

Future<SubjectModel> getSubject(int id, int day, int time) async {
  final storage = TTsStorage();
  return await storage.read(id, day, time);
}

OverlayEntry getEntry(SubjectModel content){
  return OverlayEntry(
      builder: (BuildContext context) {
        return BottomOverlay(
            height: 0.4,
            content: TTOverlay(childContent: content),
            hideFunc: hideOverlayTT
        );
      }
  );
}

void showOverlayTT(BuildContext context, SubjectModel content) {
  print("ShowOverlay!!!!!!!!!!!!");
  Overlay.of(context).insert(getEntry(content));
}
void hideOverlayTT(overlayInstance) {
  overlayInstance.remove();
}

class TTOverlay extends StatefulWidget {
  final SubjectModel childContent;
  const TTOverlay({super.key, required this.childContent});

  @override
  State<TTOverlay> createState() => _TTOverlayState();
}

class _TTOverlayState extends State<TTOverlay> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('AA'),);
  }
}