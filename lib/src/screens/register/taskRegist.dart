import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/bottom_bar.dart';
import 'package:student_support/src/sample.dart';

const _bodyContents = Center(
  child: Column(
    children: [
      Expanded(child: BasicText(text: '課題登録', size: 20),),
      BottomBar(selected: 3,)
    ],
  )
);
  

@RoutePage()
class TaskRegistPage extends StatelessWidget {
  const TaskRegistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenWidget(
      titleTxt: '課題登録', 
      bodyContents: _bodyContents,
      drawerFlg: 1,
    );
  }
}