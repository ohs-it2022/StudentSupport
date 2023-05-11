import 'package:flutter/material.dart';
import 'package:student_support/src/app.dart';

// 色の定義 (各画面でsample.dartをimportすることで使えるようになる)
const bgColor1 = Color.fromRGBO(28, 28, 28, 1);
const bgColor2 = Color.fromRGBO(63, 63, 63, 1);
const textColor = Colors.white;

// アイコンの定義
const homeIcon = Icons.home;                // ホーム
const attendanceInfoIcon = Icons.badge;     // 出欠確認
const taskRegistIcon  = Icons.book;         // 課題登録
const timeTableChangeIcon = Icons.calendar_month;  // 時間割変更
const settingIcon = Icons.settings;         // 一般設定

// 基本のテキスト設定
class BasicText extends StatelessWidget {
  final String text;
  final double size;
  const BasicText({super.key, required this.text, required this.size });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: textColor, fontSize: size),
    );
  }
}

// 基本のアイコン設定
class BasicIcon extends StatelessWidget {
  final dynamic iconType;
  final double size;
  const BasicIcon({super.key, required this.iconType, required this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconType,
      color: textColor,
      size: size,
    );
  }
}


// 各画面のウィジェット
class ScreenWidget extends StatelessWidget {
  final String titleTxt;
  final dynamic bodyContents;
  final int drawerFlg;
  const ScreenWidget({super.key, required this.titleTxt, required this.bodyContents, this.drawerFlg = 0});


  @override
  Widget build(BuildContext context) {
    dynamic _drawer;
    if(drawerFlg == 1){
      _drawer = const OverlayWidget();
    }else{
      _drawer = null;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(titleTxt),
      ),
  
      drawer: _drawer,

      body: bodyContents,
    );
  }
}


// ドロップダウンメニュー
class DropdownButtonMenu extends StatefulWidget {
  final List<String> menuElem;
  final int idx;
  const DropdownButtonMenu({Key? key, required this.menuElem, this.idx = 0}) : super(key: key);

  @override
  State<DropdownButtonMenu> createState() => _DropdownButtonMenuState();
}

class _DropdownButtonMenuState extends State<DropdownButtonMenu> {

  late String isSelectedValue = widget.menuElem[widget.idx];
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: isSelectedValue,
      items: widget.menuElem
              .map((String list) => DropdownMenuItem(
                value: list, 
                child: Container(
                  // width: 100,
                  // alignment: Alignment.center,
                  child: BasicText(text: list, size: 20)
                )
              ))
              .toList(),
      onChanged: (String? value) {
        setState(() {
          isSelectedValue = value!;
        });
      },
      dropdownColor: bgColor2,
    );
  }
}