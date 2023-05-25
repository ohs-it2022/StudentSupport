import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/bottom_bar.dart';
import 'package:student_support/src/sample.dart';

@RoutePage()
class TimeTablePage extends StatelessWidget {
  const TimeTablePage({super.key});
  
  @override
  Widget build(BuildContext context) {

    return ScreenWidget(
      titleTxt: '時間割', 
      drawerFlg: 1,
      bodyContents: Center(
        child: Column(
          children: [
            Expanded(child: Text('週'),),
            BottomBar(selected: 2,)
          ],
        )
      ) 
    );
  }
}