import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

@RoutePage()
class HomeUnitPage extends StatelessWidget {
  const HomeUnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyCont = Center(
      child: Text('単元詳細', style: TextStyle(color: textColor),),
    );
    return ScreenWidget(titleTxt:'単元詳細', bodyContents: bodyCont);
  }
}