import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyCont = Center(
      child: Text('一般設定画面', style: TextStyle(color: textColor),),
    );
    return ScreenWidget(
      titleTxt: '一般設定', 
      bodyContents: bodyCont,
    );
  }
}