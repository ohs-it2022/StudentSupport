import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/bottom_bar.dart';
import 'package:student_support/src/sample.dart';

const _bodyContents = Center(
  child: Column(
    children: [
      Expanded(child: BasicText(text: '設定', size: 20),),
      BottomBar()
    ],
  )
);

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenWidget(
      titleTxt: '設定', 
      bodyContents: _bodyContents,
      drawerFlg: 1,
    );
  }
}