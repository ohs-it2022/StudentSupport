import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

class AttendanceInfoPage extends StatelessWidget {
  const AttendanceInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyCont = Center(
      child: Text('出欠管理画面', style: TextStyle(color: textColor),),
    );
    return ScreenWidget(
      titleTxt: '出欠管理', 
      bodyContents: bodyCont,
    );
  }
}