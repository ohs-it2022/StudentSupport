import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/sample.dart';

class BottomBar extends StatelessWidget {
  final selected;
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
      decoration: BoxDecoration(
        color: bgColor2,
        boxShadow: [
          BoxShadow(),
        ],
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomBarElem(nextPage: TabBarRoute(), icon: homeIcon, text: 'ホーム', selectFlg: selectlist[0],),
          BottomBarElem(nextPage: AttendanceInfoRoute(), icon: attendanceInfoIcon, text: '出欠情報', selectFlg: selectlist[1],),
          BottomBarElem(nextPage: TaskRegistRoute(), icon: taskRegistIcon, text: '課題登録', selectFlg: selectlist[2],)
        ],
      )
    );
  }
}

class BottomBarElem extends StatelessWidget {
  final nextPage;
  final icon;
  final text;
  final selectFlg;
  const BottomBarElem({super.key, required this.nextPage, required this.icon, required this.text, this.selectFlg=0});

  @override
  Widget build(BuildContext context) {
    final dynamic buttonElem;
    if (selectFlg == 1){
      buttonElem = [
        Icon(icon, color: Colors.white,),
        Text(text, style: TextStyle(color: Colors.white),)
      ];
    }
    else{
      buttonElem = [
        Icon(icon, color: Color.fromRGBO(110, 110, 110, 1),),
        Text(text, style: TextStyle(color: Color.fromRGBO(110, 110, 110, 1)),)
      ];
    }
    return TextButton(
        onPressed: (){
          AutoRouter.of(context).replace(nextPage);
        }, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          
          children: buttonElem
        ),
        style: ElevatedButton.styleFrom(
          primary: bgColor2,
          onPrimary: Colors.black
        ),
      )
    ;
  }
}