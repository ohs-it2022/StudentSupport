import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/bottom_bar.dart';
// import 'package:student_support/routers/app_router.gr.dart';
// import 'package:student_support/src/app.dart';
import 'package:student_support/src/sample.dart';

@RoutePage()
class HomeWeekPage extends StatelessWidget {
  const HomeWeekPage({super.key});
  
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Expanded(child: BasicText(text: '週', size: 20),),
        BottomBar()
      ],
    );
  }
}