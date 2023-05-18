import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/sample.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: bgColor1,
      // decoration: BoxDecoration(
      //   boxShadow: [
      //     BoxShadow(),
      //   ],
      // ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: (){
              AutoRouter.of(context).popAndPush(TabBarRoute());
            }, 
            icon: Icon(homeIcon)
          ),
          IconButton(
            onPressed: (){
              AutoRouter.of(context).popAndPush(AttendanceInfoRoute());
            }, 
            icon: Icon(attendanceInfoIcon)
          ),
          IconButton(
            onPressed: (){
              AutoRouter.of(context).popAndPush(TaskRegistRoute());
            }, 
            icon: Icon(taskRegistIcon)
          )
        ],
      )
    );
  }
}