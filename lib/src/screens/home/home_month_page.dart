import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/sample.dart';

@RoutePage()
class HomeMonthPage extends StatelessWidget {
  const HomeMonthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyCont = Center(
      child: Column(
        children: [
          Text('月次 時間割', style: TextStyle(color: textColor),),
          ElevatedButton(
            child: const Text('週次時間割画面へ'),
            onPressed: () => context.router.push(const HomeWeekRoute()),
          )
        ],
      )
    );
    return ScreenWidget(titleTxt: '月次 時間割', bodyContents: bodyCont);
  }
}