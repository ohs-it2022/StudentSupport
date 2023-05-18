import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

@RoutePage()
class HomeUnitPage extends StatelessWidget {
  const HomeUnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BasicText(text: '単元', size: 20),
    );
    
  }
}