import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

// オーバーレイの要素のウィジェット
class OverlayElem extends StatelessWidget {
  final dynamic iconType;
  final String btnTxt;
  final dynamic nextRoot;
  const OverlayElem({super.key, required this.iconType, required this.btnTxt, required this.nextRoot});

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
        onPressed: (){
          Navigator.of(context).pop();
          Navigator.pushNamed(context, nextRoot);
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
    const topBtn = OverlayElem(iconType: homeIcon, btnTxt: 'ホーム', nextRoot: '/',);
    const attendanceInfoBtn = OverlayElem(iconType: attendanceInfoIcon, btnTxt: '出欠情報', nextRoot: '/attendInfo',);
    const taskRegistBtn = OverlayElem(iconType: taskRegistIcon, btnTxt: '課題登録', nextRoot: '/taskRegist',);
    const timeTableChangeBtn = OverlayElem(iconType: timeTableChangeIcon, btnTxt: '時間割変更', nextRoot: '/TTChange',);
    const settingBtn = OverlayElem(iconType: settingIcon, btnTxt: '一般設定', nextRoot: '/Settings',);
    const overlayBtn = [
      topBtn, 
      attendanceInfoBtn, 
      taskRegistBtn, 
      timeTableChangeBtn, 
      settingBtn,
    ];
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: bgColor2,
      ),
      child: Drawer(
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
      ),
    );
  }
}

// 下のメニューの要素
class BottomMenuElem extends StatelessWidget {
  final dynamic iconType;
  final dynamic nextRoot;
  const BottomMenuElem({super.key, required this.iconType, required this.nextRoot});

  @override
  Widget build(BuildContext context) {
    final elem = ElevatedButton(
          onPressed: (){
            Navigator.of(context).pop();
            Navigator.pushNamed(context, nextRoot);
          }, 
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            backgroundColor: bgColor1
          ),
          child: BasicIcon(iconType: iconType, size: 20,),
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
        BottomMenuElem(iconType: homeIcon, nextRoot: '/',),
        BottomMenuElem(iconType: attendanceInfoIcon, nextRoot: '/attendInfo',),
        BottomMenuElem(iconType: taskRegistIcon, nextRoot: '/taskRegist',),
    ],);

    final con = Container(
      color: bgColor2,
      height: 50,
      child: row,
    );
    return con;
  }
}