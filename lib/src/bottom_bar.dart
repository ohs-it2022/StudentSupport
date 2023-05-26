import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/sample.dart';

class BottomBar extends StatelessWidget {
  final dynamic selected;
  const BottomBar({super.key, this.selected=0});
  
  @override
  Widget build(BuildContext context) {
    final List selectlist;
    if (selected==1){
      selectlist = [1,0,0];
    }else if(selected==2){
      selectlist = [0,1,0];
    }else if(selected==3){
      selectlist = [0,0,1];
    }else{
      selectlist = [0,0,0];
    }
    return Container(
      decoration: const BoxDecoration(
        color: bgColor2,
        boxShadow: [
          BoxShadow(),
        ],
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomBarElem(nextPage: const TabBarRoute(), icon: homeIcon, text: 'ホーム', selectFlg: selectlist[0],),
          BottomBarElem(nextPage: const TimeTableRoute(), icon: timeTableIcon, text: '時間割', selectFlg: selectlist[1],),
          BottomBarElem(nextPage: const TaskRegistRoute(), icon: taskRegistIcon, text: '課題登録', selectFlg: selectlist[2],)
        ],
      )
    );
  }
}

class BottomBarElem extends StatelessWidget {
  final dynamic nextPage;
  final dynamic icon;
  final dynamic text;
  final int selectFlg;
  const BottomBarElem({super.key, required this.nextPage, required this.icon, required this.text, this.selectFlg=0});

  @override
  Widget build(BuildContext context) {
    final dynamic buttonElem;
    if (selectFlg == 1){
      buttonElem = [
        Icon(icon, color: Colors.white,),
        Text(text, style: const TextStyle(color: Colors.white),)
      ];
    }
    else{
      buttonElem = [
        Icon(icon, color: const Color.fromRGBO(110, 110, 110, 1),),
        Text(text, style: const TextStyle(color: Color.fromRGBO(110, 110, 110, 1)),)
      ];
    }
    return TextButton(
        onPressed: (){
          AutoRouter.of(context).replace(nextPage);
        }, 
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor2,
          foregroundColor: Colors.black
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: buttonElem
        ),
      )
    ;
  }
}