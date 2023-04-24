import 'package:flutter/material.dart';
import 'package:student_support/main.dart';
import 'package:student_support/src/screens/kinosita/attendanceInfo.dart';
import 'package:student_support/src/screens/morita/taskRegist.dart';
import 'package:student_support/src/screens/wata/TT_change.dart';

// 色の定義
final bgColor1 = Color.fromRGBO(28, 28, 28, 1);
final bgColor2 = Color.fromRGBO(63, 63, 63, 1);
final textColor = Colors.white;

// オーバーレイの要素のウィジェット
class OverlayElem extends StatelessWidget {
  final icon_type;
  final String btnTxt;
  final nextPage;
  const OverlayElem({super.key, required this.icon_type, required this.btnTxt, required this.nextPage});

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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextPage),
          );
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
    final topBtn = OverlayElem(icon_type: Icons.home, btnTxt: 'ホーム', nextPage: MyApp(),);
    final attendanceInfoBtn = OverlayElem(icon_type: Icons.badge, btnTxt: '出欠情報', nextPage: AttendanceInfoPage(),);
    final jobRegistBtn = OverlayElem(icon_type: Icons.book, btnTxt: '課題登録', nextPage: TaskRegist(),);
    final timetableChangeBtn = OverlayElem(icon_type: Icons.calendar_month, btnTxt: '時間割変更', nextPage: TTChange(),);
    final settingBtn = OverlayElem(icon_type: Icons.settings, btnTxt: '一般設定', nextPage: TTChange(),);
    final overlayBtn = [
      topBtn, 
      attendanceInfoBtn, 
      jobRegistBtn, 
      timetableChangeBtn, 
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
  final nextPage;
  const BottomMenuElem({super.key, required this.icon_type, required this.nextPage});

  @override
  Widget build(BuildContext context) {
    final elem = ElevatedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => nextPage),
            );
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
        BottomMenuElem(icon_type: Icons.home, nextPage: MyApp(),),
        BottomMenuElem(icon_type: Icons.badge, nextPage: AttendanceInfoPage(),),
        BottomMenuElem(icon_type: Icons.book, nextPage: TaskRegist(),),
    ],);

    final con = Container(
      color: bgColor2,
      height: 50,
      child: row,
    );
    return con;
  }
}