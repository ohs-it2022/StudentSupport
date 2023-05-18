import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

@RoutePage()
class HomeWeekPage extends StatelessWidget {
  const HomeWeekPage({super.key});
  
  @override
  Widget build(BuildContext context) {

    return const BasicText(text: '週', size: 20);
  }
}