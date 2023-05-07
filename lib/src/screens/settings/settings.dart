import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

final _bodyContents = Center(
  child: Text('設定')
);

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      titleTxt: '設定', 
      bodyContents: _bodyContents
    );
  }
}