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

// 大きさの指定
const double appBarTextSize = 20;

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


// ホームの各画面のウィジェット
class HomeScreenWidget extends StatelessWidget {
  final dynamic bodyContents;
  const HomeScreenWidget({super.key, required this.bodyContents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: bodyContents,
    );
  }
}

// ホーム以外の画面
class ScreenWidget extends StatelessWidget {
  final String titleTxt;
  final dynamic bodyContents;
  const ScreenWidget({super.key, required this.titleTxt, required this.bodyContents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,

      appBar: AppBar(
        backgroundColor: bgColor2,
        title: BasicText(text: titleTxt, size: appBarTextSize),
      ),

      drawer: const OverlayWidget(),

      body: bodyContents,

      bottomNavigationBar: const BottomMenuWidget(),

    );
  }
}

