import 'package:flutter/material.dart';
import 'package:student_support/src/app.dart';

// 色の定義
const bgColor1 = Color.fromRGBO(28, 28, 28, 1);
const bgColor2 = Color.fromRGBO(63, 63, 63, 1);
const textColor = Colors.white;

// 画面のウィジェット
class ScreenWidget extends StatelessWidget {
  final bodyContents;
  const ScreenWidget({super.key, required this.bodyContents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: bodyContents,
    );
  }
}


