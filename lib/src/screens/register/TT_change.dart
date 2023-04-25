import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

class TTChange extends StatelessWidget {
  const TTChange({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyCont = Center(
      child: Text('時間割変更画面', style: TextStyle(color: textColor),),
    );
    return ScreenWidget(
      titleTxt: '時間割変更', 
      bodyContents: bodyCont,
    );
  }
}