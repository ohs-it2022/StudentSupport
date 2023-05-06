import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/app.dart';
import 'package:student_support/src/sample.dart';

@RoutePage()
class HomeWeekPage extends StatelessWidget {
  const HomeWeekPage({super.key});
  
  @override
  Widget build(BuildContext context) {

    final bodyCont = Center(
      child: Column(
        children: [
          Text('週次 時間割', style: TextStyle(color: textColor),),
          ElevatedButton(
            child: const Text('日次時間割へ'),
            onPressed: () => context.router.push(const HomeDayRoute()),
          )
        ],
      )
    );

    return Center(
      child: BasicText(text: '週', size: 20),
    );
  }
}