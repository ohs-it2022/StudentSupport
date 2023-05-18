import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/bottom_bar.dart';
import 'package:student_support/src/sample.dart';

final _bodyContents = Center(
  child: Column(
    children: [
      Expanded(child: BasicText(text: '出欠情報', size: 20),),
      BottomBar(selected: 2,)
    ],
  )
);

@RoutePage()
class AttendanceInfoPage extends StatelessWidget {
  const AttendanceInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      titleTxt: '出欠情報', 
      bodyContents: _bodyContents,
      drawerFlg: 1,
    );
  }
}