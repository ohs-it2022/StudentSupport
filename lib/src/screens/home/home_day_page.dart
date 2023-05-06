import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';
import 'package:student_support/routers/app_router.gr.dart';


@RoutePage()
class HomeDayPage extends StatelessWidget {
  const HomeDayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyCont = Center(
      child: Column(
        children: [
          Text('日次 時間割', style: TextStyle(color: textColor),),
          ElevatedButton(
            child: const Text('詳細ページへ'),
            onPressed: () => context.router.push(const HomeUnitRoute()),
          )
        ],
      )
    );
    return ScreenWidget(titleTxt: '日次 時間割', bodyContents: bodyCont);
  }
}