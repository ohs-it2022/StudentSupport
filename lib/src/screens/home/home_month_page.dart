import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/sample.dart';

@RoutePage()
class HomeMonthPage extends StatelessWidget {
  const HomeMonthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BasicText(text: '月', size: 20)
    );
  }
}