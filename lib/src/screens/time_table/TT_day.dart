import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

class TTDay extends StatelessWidget {
  const TTDay({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyCont = Center(
      child: Text('日次 時間割', style: TextStyle(color: textColor),),
    );
    return ScreenWidget(titleTxt: '日次 時間割', bodyContents: bodyCont);
  }
}