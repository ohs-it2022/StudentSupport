import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/sample.dart';
import 'dart:convert';
import 'package:student_support/src/function.dart';

@RoutePage()
class HomeDayPage extends StatefulWidget {
  final int month;
  final int day;
  final weekday;
  const HomeDayPage({super.key, required this.month, required this.day, required this.weekday});

  @override
  State<HomeDayPage> createState() => _HomeDayPageState();
}

var dayTimeTable;
class _HomeDayPageState extends State<HomeDayPage> {

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
        dayTimeTable = decodeJson[weekday-1].cast<String>() as List<String>;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;  // 画面の横幅
    String weekdayJP = getWeekDayJP(widget.weekday);
    
    List<Widget> makeDayTable(){
      final List<Widget> dayTable = <Widget>[];
      dayTimeTable.asMap().forEach((i, test) {
        var work = Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: bgColor1,
          ),
          width: screenWidth * 0.7,
          padding: const EdgeInsets.all(5),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0 
            ),
            child: Column(
              children: [
                BasicText(text: '${i+1}時間目', size: 15),
                BasicText(text: test, size: 25,)
              ],
            ),
            onPressed: (){
              AutoRouter.of(context).popAndPush(const HomeUnitRoute());
            },
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: bgColor2,
          ),
          padding: const EdgeInsets.all(10),
          width: screenWidth,
          margin: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
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