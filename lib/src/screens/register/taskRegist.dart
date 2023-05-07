import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

final _bodyContents = Center(
  child: BasicText(text: '課題登録', size: 20),
);

@RoutePage()
class TaskRegistPage extends StatelessWidget {
  const TaskRegistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      titleTxt: '課題登録', 
      bodyContents: _bodyContents
    );
  }
}