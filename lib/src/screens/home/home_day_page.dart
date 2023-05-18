import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';


@RoutePage()
class HomeDayPage extends StatelessWidget {
  const HomeDayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BasicText(text: '日', size: 20),
    );
  }
} 