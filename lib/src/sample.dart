import 'package:flutter/material.dart';
import 'package:student_support/src/app.dart';

// ホームの各画面のウィジェット
class HomeScreenWidget extends StatelessWidget {
  final bodyContents;
  const HomeScreenWidget({super.key, required this.bodyContents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: bodyContents,
    );
  }
}

class ScreenWidget extends StatelessWidget {
  final String titleTxt;
  final bodyContents;
  const ScreenWidget({super.key, required this.titleTxt, required this.bodyContents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,

      appBar: AppBar(
        backgroundColor: bgColor2,
        title: Text('$titleTxt'),
      ),

      // drawer: OverlayWidget(),

      body: bodyContents,

      bottomNavigationBar: BottomMenuWidget(),

    );
  }
}

