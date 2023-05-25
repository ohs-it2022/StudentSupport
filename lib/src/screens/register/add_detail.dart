import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/sample.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_support/src/screens/register/taskRegist.dart';

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
    var titleSubName;
    var subName = '';
    var classRoom = '';
    var teacher = '';

    return ScreenWidget(
      titleTxt: '単元追加', 
      bodyContents: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: '表示名'),
              onChanged: (value) => (titleSubName = value),
            ),
            TextField(
              decoration: InputDecoration(hintText: '正式名称(任意)'),
              onChanged: (value) => (subName = value),
            ),
            TextField(
              decoration: InputDecoration(hintText: '教室名(任意)'),
              onChanged: (value) => (classRoom = value),
            ),
            TextField(
              decoration: InputDecoration(hintText: '教科担当(任意)'),
              onChanged: (value) => (teacher = value),
            ),
            ElevatedButton(
              onPressed: (){
                final a;
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