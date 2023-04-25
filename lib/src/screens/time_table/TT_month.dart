import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

// TT : TimeTable
class TTMonth extends StatelessWidget {
  const TTMonth({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyCont = Center(
      child: Text('月次 時間割', style: TextStyle(color: textColor),),
    );
    return HomeScreenWidget(bodyContents: bodyCont);
  }
}