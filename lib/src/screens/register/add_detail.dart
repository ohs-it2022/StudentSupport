import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/sample.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_support/src/screens/register/taskRegist.dart';

Future<void> subjectRegist(list) async{
  final prefs = await SharedPreferences.getInstance();
  final work = jsonEncode(list).toString();
  await prefs.setString('timeTable', work);
}

@RoutePage()
class AddDetailPage extends StatelessWidget {
  final int num;
  final int dayOfWeek;
  final List<List<String>> weekTimeTable;
  const AddDetailPage({super.key, required this.num, required this.dayOfWeek, required this.weekTimeTable});

  @override
  Widget build(BuildContext context) {
    var titleSubName;
    var subName = '';
    var classRoom = '';
    var teacher = '';
    List<List<String>> weekTimeTableAdd = weekTimeTable as List<List<String>>;

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
                weekTimeTableAdd[dayOfWeek][num] = titleSubName;
                subjectRegist(weekTimeTable);
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