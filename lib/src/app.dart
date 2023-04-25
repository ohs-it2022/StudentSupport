import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

// オーバーレイの要素のウィジェット
class OverlayElem extends StatelessWidget {
  final icon_type;
  final String btnTxt;
  final nextRoot;
  const OverlayElem({super.key, required this.icon_type, required this.btnTxt, required this.nextRoot});

  @override
  Widget build(BuildContext context) {

    final icon = Icon(
      icon_type,
      color: textColor,
      size: 30,
    );
    final text = Text(
      '$btnTxt', 
      style: TextStyle(color: textColor, fontSize: 20),
    );
    final row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:[
        icon,
        text
      ],
    );
    final btn  = SizedBox(
      width: 200,
      height: 80,
      
      child: ElevatedButton(
        onPressed: (){
          Navigator.of(context).pop();
          Navigator.pushNamed(context, nextRoot);
        }, 
        child: row, 
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          primary: bgColor1
        ),
      )
    );
    final elem = Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
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
    var _screenSize = MediaQuery.of(context).size;  // 画面のサイズを取得
    final drawerWidth = _screenSize.width * 0.7;

    // オーバーレイのボタン作成
    final topBtn = OverlayElem(icon_type: homeIcon, btnTxt: 'ホーム', nextRoot: '/',);
    final attendanceInfoBtn = OverlayElem(icon_type: attendanceInfoIcon, btnTxt: '出欠情報', nextRoot: '/attendInfo',);
    final taskRegistBtn = OverlayElem(icon_type: taskRegistIcon, btnTxt: '課題登録', nextRoot: '/taskRegist',);
    final TTChangeBtn = OverlayElem(icon_type: TTChangeIcon, btnTxt: '時間割変更', nextRoot: '/TTChange',);
    final settingBtn = OverlayElem(icon_type: settingIcon, btnTxt: '一般設定', nextRoot: '/Settings',);
    final overlayBtn = [
      topBtn, 
      attendanceInfoBtn, 
      taskRegistBtn, 
      TTChangeBtn, 
      settingBtn,
    ];
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: bgColor2,
      ),
      child: Drawer(
        width: drawerWidth,
        child: Column(
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
  final icon_type;
  final nextRoot;
  const BottomMenuElem({super.key, required this.icon_type, required this.nextRoot});

  @override
  Widget build(BuildContext context) {
    final elem = ElevatedButton(
          onPressed: (){
            Navigator.of(context).pop();
            Navigator.pushNamed(context, nextRoot);
          }, 
          child: Icon(icon_type, color: textColor,),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            primary: bgColor1
          ),);
    return elem;
  }
}

// 下メニューのウィジェット
class BottomMenuWidget extends StatelessWidget {
  const BottomMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BottomMenuElem(icon_type: homeIcon, nextRoot: '/',),
        BottomMenuElem(icon_type: attendanceInfoIcon, nextRoot: '/attendInfo',),
        BottomMenuElem(icon_type: taskRegistIcon, nextRoot: '/taskRegist',),
    ],);

    final con = Container(
      color: bgColor2,
      height: 50,
      child: row,
    );
    return con;
  }
}