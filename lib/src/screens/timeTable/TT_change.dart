import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/bottom_bar.dart';
import 'package:student_support/src/sample.dart';
import 'package:student_support/src/screens/timeTable/TT_sample.dart';
import 'package:student_support/src/screens/timeTable/form.dart';

@RoutePage()
class TTChangeRouterPage extends AutoRouter {
  const TTChangeRouterPage({super.key});
}

// List<List<String>> weekTimeTable = initTimeTable;

// データ
var testTimeTable = [
  ["DB", "DB", "AS", "FX", "AS", ""],
  ["", "", "MK", "CL", "CL", "NT"],
  ["", "", "CS", "CS", "NT", ""],
  ["IA", "IA", "", "", "", ""],
  ["", "", "", "", "", ""],
  ["IO", "IO", "", "", "", ""],  
];

var testDetail = [
  [
    ["データベース", "161", "山田"],
    ["データベース", "161", "山田"],
    ["AI開発", "043", "高木"],
    ["", "043", "高木"],
    ["AI開発", "043", "高木"],
    ["", "", ""]
  ],
  [
    ["", "", ""],
    ["", "", ""],
    ["マーケティング", "101", "植島"],
    ["C/C++", "043", "高木"],
    ["C/C++", "043", "高木"],
    ["ネットワーク", "191", ""]
  ],
  [
    ["", "", ""],
    ["", "", ""],
    ["コンピュータサイエンス", "オンライン", "渡瀬"],
    ["コンピュータサイエンス", "オンライン", "渡瀬"],
    ["ネットワーク", "オンライン", ""],
    ["", "", ""]
  ],
  [
    ["IA", "161", "仲尾"],
    ["IA", "161", "仲尾"],
    ["", "", ""],
    ["", "", ""],
    ["", "", ""],
    ["", "", ""]
  ],
  [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""],
    ["", "", ""],
    ["", "", ""],
    ["", "", ""]
  ],
  [
    ["IoT", "191", "永峰"],
    ["IoT", "191", "永峰"],
    ["", "", ""],
    ["", "", ""],
    ["", "", ""],
    ["", "", ""],
  ]
];

// Future<void> initSetTimeTable() async{
//   SharedPreferences _prefs = await SharedPreferences.getInstance();
//   final jsonString = _prefs.getString("timeTable") ?? "";
//   if (jsonString == ""){
//     final work = jsonEncode(initTimeTable).toString();
//     await _prefs.setString('timeTable', work);
//   }
// }

// 画面全体のウィジェット
@RoutePage()
class TTChangePage extends StatefulWidget {
  const TTChangePage({super.key});

  @override
  State<TTChangePage> createState() => _TTChangePageState();
}

class _TTChangePageState extends State<TTChangePage> {

  // @override
  // void initState(){
  //   super.initState();
  //   initSetTimeTable();
  //   getWeekTimeTable();
  //   print(weekTimeTable);
  // }

  // void getWeekTimeTable() async{
  //   final _prefs = await SharedPreferences.getInstance();
  //   if (_prefs.containsKey('timeTable')){
  //     setState(() {
  //       final jsonString = _prefs.getString("timeTable") ?? "";
  //       final decodeJson = jsonDecode(jsonString);
  //       decodeJson.asMap().forEach((i, elemList){
  //         List<String> workList = [];
  //         for (final String elem in elemList){
  //           workList.add(elem);
  //         }
  //         weekTimeTable[i] = (workList);
  //       });
  //       print(weekTimeTable);
  //     });
  //   }
  // }

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

    final bodyCont = Center(
      child: Column(
        children: [
          Container(
            color: Colors.blue,
            height: 50,
            width: screenSize.width,
            child: Text("編集モード切替ボタンエリア"),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              width: contentsWidth,
              alignment: Alignment.center,
              decoration: sectionDecoration,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const WeekDay(),
                  for (int i=0; i<maxNum; i++)...{
                    TTRow(num: i),
                  },
                ]
              ),
            )
          ),
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
          // context.router.push(AddDetailRoute(num: num, dayOfWeek: dayOfWeek, weekTimeTable: weekTimeTable));
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => FormPage(num: num, dayOfWeek: dayOfWeek, weekTimeTable: testTimeTable))
          );
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
        TTNum(txt: '${num+1}'),
        for (int dayOfWeek=0;dayOfWeek<6;dayOfWeek++)
          TTElem(txt: testTimeTable[dayOfWeek][num], num: num, dayOfWeek: dayOfWeek,)
      ],
    );
  }
}
