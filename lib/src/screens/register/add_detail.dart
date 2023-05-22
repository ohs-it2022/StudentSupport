import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/sample.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_support/src/screens/register/taskRegist.dart';

var titleName;
var SundayList =    ['', '', '', '', '', '', ''];
var MondayList =    ['', '', '', '', '', '', ''];
var TuesdayList =   ['', '', '', '', '', '', ''];
var WednesdayList = ['', '', '', '', '', '', ''];
var ThursdayList =  ['', '', '', '', '', '', ''];
var FridayList =    ['', '', '', '', '', '', ''];
var SaturdayList =  ['', '', '', '', '', '', ''];
Map<String, List> TimeTableList = {
  '日': SundayList,
  '月': MondayList,
  '火': TuesdayList,
  '水': WednesdayList,
  '木': ThursdayList,
  '金': FridayList,
  '土': SaturdayList
};


subjectRegist(values, dayOfWeek)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('timeTable_$dayOfWeek', values[dayOfWeek]);
}
printInfo(dayOfWeek)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List? timeTable = prefs.getStringList('timeTable_$dayOfWeek');
  print(timeTable);
}
@RoutePage()
class AddDetailPage extends StatelessWidget {
  final int num;
  final String dayOfWeek;
  const AddDetailPage({super.key, required this.num, required this.dayOfWeek});

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      titleTxt: '単元追加', 
      bodyContents: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: '表示名'
              ),
              onChanged: (value){
                titleName = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '正式名称(任意)'
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '教室名(任意)'
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '教科担当'
              ),
            ),
            ElevatedButton(
              onPressed: (){
                TimeTableList[dayOfWeek]![num - 1] = titleName;
                print(TimeTableList);
                subjectRegist(TimeTableList, dayOfWeek);
                printInfo(dayOfWeek);
                AutoRouter.of(context).replace(TTChangeRoute());
              },
              child: Text('登録')
            )
          ],
        ),
      )
    );
  }
}