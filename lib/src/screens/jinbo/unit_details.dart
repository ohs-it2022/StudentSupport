import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';
// 色の定義
const bgColor1 = Color.fromRGBO(28, 28, 28, 1);
const bgColor2 = Color.fromRGBO(63, 63, 63, 1);
const textColor = Colors.white;

class UnitDetails extends StatelessWidget {
  const UnitDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyCont = Center(
      child: Text('単元詳細', style: TextStyle(color: textColor),),
    );
    return ScreenWidget(bodyContents: bodyCont);
  }
}