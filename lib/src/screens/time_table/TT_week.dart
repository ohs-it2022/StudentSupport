import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

class TTWeek extends StatelessWidget {
  const TTWeek({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyCont = Center(
      child: Text('週次 時間割', style: TextStyle(color: textColor),),
    );
    return ScreenWidget(titleTxt: '週次 時間割', bodyContents: bodyCont);
  }
}