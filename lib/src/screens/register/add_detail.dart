import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

@RoutePage()
class AddDetailPage extends StatelessWidget {
  const AddDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      titleTxt: '単元詳細', 
      bodyContents: Center(
        child: Text('AAA'),
      )
    );
  }
}