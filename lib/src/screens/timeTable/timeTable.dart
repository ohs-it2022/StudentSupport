import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';
import 'package:student_support/src/screens/timeTable/TT_sample.dart';


@RoutePage()
class TimeTablePage extends StatefulWidget {
  const TimeTablePage({super.key});

  @override
  State<TimeTablePage> createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {

  // @override
  // void initState(){
  //   super.initState();
  //   updateList();
  // }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;  // 画面のサイズを取得

    final bodyCont = Center(
      child: Column(
        children: [

          Align(
            // align right
            alignment: Alignment.centerRight,
            child: Container(
              width: screenSize.width * 0.5,
              height: screenSize.height * 0.05,
              margin: EdgeInsets.fromLTRB(screenSize.width*0.02, screenSize.height*0.01, screenSize.width*0.02, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
              ),
              child:
                ElevatedButton(
                  child: const Text('編集', style: TextStyle(fontSize: 20)),
                  onPressed: () => Navigator.popAndPushNamed(context, "/edit"),
                ),
              ),
          ),

          TimeTableWidget(),
          // 編集ボタン
          


        
        ],
      )
    );
    return ScreenWidget(
      titleTxt: '時間割', 
      bodyContents: bodyCont,
      drawerFlg: 1,
    );
  }
}
