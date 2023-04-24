import 'package:flutter/material.dart';
import 'package:student_support/src/app.dart';
import 'package:student_support/src/sample.dart';

class UnitDetails extends StatelessWidget {
  const UnitDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyCont = Center(
      child: Text('単元詳細', style: TextStyle(color: textColor),),
    );
    return HomeScreenWidget(bodyContents: bodyCont);
  }
}