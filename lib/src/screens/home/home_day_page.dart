import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/sample.dart';
import 'dart:convert';


@RoutePage()
class HomeDayPage extends StatefulWidget {
  final int month;
  final int day;
  final weekday;
  const HomeDayPage({super.key, required this.month, required this.day, required this.weekday});

  @override
  State<HomeDayPage> createState() => _HomeDayPageState();
}

// var timeTable = [
//   for (int i=0;i<maxNum;i++) ''
// ];
var dayTimeTable;
class _HomeDayPageState extends State<HomeDayPage> {
  final prefs = SharedPreferences.getInstance();
  final controller = TextEditingController();
  String value = '';

  @override
  void initState(){
    super.initState();
    getDayTimeTable(widget.weekday);
  }

  void getDayTimeTable(weekday) async{
    final _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('timeTable')){
      setState(() {
        final jsonString = _prefs.getString("timeTable") ?? "";
        final decodeJson = jsonDecode(jsonString);
        dayTimeTable = decodeJson[weekday].cast<String>() as List<String>;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;  // 画面の横幅
    var weekdayJP;
    if (widget.weekday == 1){
      weekdayJP = '月';
    }else if(widget.weekday == 2){
      weekdayJP = '火';
    }else if(widget.weekday == 3){
      weekdayJP = '水';
    }else if(widget.weekday == 4){
      weekdayJP = '木';
    }else if(widget.weekday == 5){
      weekdayJP = '金';
    }else if(widget.weekday == 6){
      weekdayJP = '土';
    }else{
      weekdayJP = '日';
    }
    List<Widget> makeDayTable(){
      final List<Widget> dayTable = <Widget>[];
      dayTimeTable.asMap().forEach((i, test) {
        var work = Container(
          color: bgColor1,
          child: Column(
            children: [
              Text('${i+1}時間目'),
              Text(test)
            ],
          )
        );
        dayTable.add(work);
      });
      return dayTable;
    }
    if (dayTimeTable != null){
      final dayTable = makeDayTable();
      return Center(
        child: Container(
          color: bgColor2,
          width: screenWidth,
          margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: BasicText(text: '${widget.month}月${widget.day}日($weekdayJP)', size: 20),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: dayTable,
                ),
              )
            ],
          )
        )
      );
    }
    else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('時間割が登録されていません。'),
            ElevatedButton(
              onPressed: (){
                AutoRouter.of(context).popAndPush(TTChangeRouterRoute());
              }, 
              child: Text('時間割登録')
            )
          ],
        ),
      );
    } 
  }
}
