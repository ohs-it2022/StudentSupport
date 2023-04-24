import 'package:flutter/material.dart';
import 'package:student_support/src/app.dart';
import 'package:student_support/src/sample.dart';

class TaskRegist extends StatelessWidget {
  const TaskRegist({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyCont = Center(
      child: Text('課題登録画面', style: TextStyle(color: textColor),),
    );
    return ScreenWidget(
      titleTxt: '課題登録', 
      bodyContents: bodyCont,
    );
  }
}