import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

// オーバーレイの要素のウィジェット
@RoutePage()
class OverlayElem extends StatelessWidget {
  final dynamic iconType;
  final String btnTxt;
  final dynamic nextPage;
  const OverlayElem({super.key, required this.iconType, required this.btnTxt, required this.nextPage});

  @override
  Widget build(BuildContext context) {

    final icon = BasicIcon(iconType: iconType, size: 30);
    final text = BasicText(text: btnTxt, size: 20);
    final row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:[ icon, text ],
    );
    final btn  = SizedBox(
      width: 200,
      height: 80,
      
      child: ElevatedButton(
        onPressed: () {
          AutoRouter.of(context).pop();
          AutoRouter.of(context).pushNamed(nextPage);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          backgroundColor: bgColor1
        ),
        child: row, 
      )
    );
    final elem = Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: btn,
    );
    return elem;
  }
}


// オーバーレイのウィジェット
class OverlayWidget extends StatelessWidget {
  const OverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // オーバーレイの横幅(今は画面全体の７割)
    var screenSize = MediaQuery.of(context).size;  // 画面のサイズを取得
    final drawerWidth = screenSize.width * 0.7;

    // オーバーレイのボタン作成
    const topBtn = OverlayElem(iconType: homeIcon, btnTxt: 'ホーム', nextPage: '/home',);
    const attendanceInfoBtn = OverlayElem(iconType: timeTableIcon, btnTxt: '時間割', nextPage: '/attend',);
    const taskRegistBtn = OverlayElem(iconType: taskRegistIcon, btnTxt: '課題登録', nextPage: '/task',);
    const timeTableChangeBtn = OverlayElem(iconType: timeTableChangeIcon, btnTxt: '時間割変更', nextPage: '/timetableChangeRouter',);
    const settingBtn = OverlayElem(iconType: settingIcon, btnTxt: '一般設定', nextPage: '/settings',);
    const overlayBtn = [
      topBtn, 
      attendanceInfoBtn, 
      taskRegistBtn, 
      timeTableChangeBtn, 
      settingBtn,
    ];
    return Drawer(
      width: drawerWidth,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: overlayBtn
          )
        ]
      ),
    );
  }
}