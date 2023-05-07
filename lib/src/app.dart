import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/routers/app_router.gr.dart';
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
        onPressed: () => context.router.pushAndPopUntil(nextPage, predicate: (Route<dynamic> route) => false),
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
    const topBtn = OverlayElem(iconType: homeIcon, btnTxt: 'ホーム', nextPage: TabBarRoute(),);
    const attendanceInfoBtn = OverlayElem(iconType: attendanceInfoIcon, btnTxt: '出欠情報', nextPage: AttendanceInfoRoute(),);
    const taskRegistBtn = OverlayElem(iconType: taskRegistIcon, btnTxt: '課題登録', nextPage: TaskRegistRoute(),);
    const timeTableChangeBtn = OverlayElem(iconType: timeTableChangeIcon, btnTxt: '時間割変更', nextPage: TTChangeRoute(),);
    const settingBtn = OverlayElem(iconType: settingIcon, btnTxt: '一般設定', nextPage: SettingsRoute(),);
    const overlayBtn = [
      topBtn, 
      attendanceInfoBtn, 
      taskRegistBtn, 
      timeTableChangeBtn, 
      settingBtn,
    ];
    // return Theme(
    //   data: Theme.of(context).copyWith(
    //     canvasColor: bgColor2,
    //   ),
    //   child: Drawer(
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
    // );
  }
}

// 下のメニューの要素
class BottomMenuElem extends StatelessWidget {
  final dynamic iconType;
  final dynamic nextPage;
  const BottomMenuElem({super.key, required this.iconType, required this.nextPage});

  @override
  Widget build(BuildContext context) {
    final elem = ElevatedButton(
          onPressed: (){
            Navigator.of(context).pop();
            Navigator.pushNamed(context, nextPage);
          }, 
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            backgroundColor: bgColor1
          ),
          child: BasicIcon(iconType: iconType, size: 25,),
        );
    return elem;
  }
}

// 下メニューのウィジェット
class BottomMenuWidget extends StatelessWidget {
  const BottomMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BottomMenuElem(iconType: homeIcon, nextPage: '/',),
        BottomMenuElem(iconType: attendanceInfoIcon, nextPage: '/attendInfo',),
        BottomMenuElem(iconType: taskRegistIcon, nextPage: '/taskRegist',),
    ],);

    return Container(
      color: bgColor2,
      height: 50,
      child: row,
    );
  }
}