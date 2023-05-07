import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

final _bodyContents = Center(
      child: Text('出欠管理'),
    );
@RoutePage()
class AttendanceInfoPage extends StatelessWidget {
  const AttendanceInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(titleTxt: '出欠情報', bodyContents: _bodyContents);
  }
}