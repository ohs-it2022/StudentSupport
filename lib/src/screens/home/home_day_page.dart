import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';


@RoutePage()
class HomeDayPage extends StatelessWidget {
  final int month;
  final int day;
  const HomeDayPage({super.key, required this.month, required this.day});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BasicText(text: '$month月$day日', size: 20),
    );
  }
} 