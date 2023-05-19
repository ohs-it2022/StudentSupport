import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/bottom_bar.dart';
import 'package:student_support/src/sample.dart';

final _work = Container(
  width: double.infinity,
  margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
  decoration: BoxDecoration(
    color: bgColor2,
    borderRadius: BorderRadius.circular(30),
  ),
  child: Container(
    margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: bgColor1,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'タイトル',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: '教科',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: '提出期限',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: '内容',
          ),
        ),
      ],
    ),
  ),
);

final _bodyContents = Center(
  child: Column(
    children: [
      Expanded(child: _work),
      BottomBar(selected: 3,)
    ],
  )
);
  

@RoutePage()
class TaskRegistPage extends StatelessWidget {
  const TaskRegistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      titleTxt: '課題登録', 
      bodyContents: _bodyContents,
      drawerFlg: 1,
    );
  }
}