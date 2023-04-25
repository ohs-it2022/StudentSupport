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
const TTChangeIcon = Icons.calendar_month;  // 時間割変更
const settingIcon = Icons.settings;         // 一般設定


// ホームの各画面のウィジェット
class HomeScreenWidget extends StatelessWidget {
  final bodyContents;
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
  final bodyContents;
  const ScreenWidget({super.key, required this.titleTxt, required this.bodyContents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,

      appBar: AppBar(
        backgroundColor: bgColor2,
        title: Text('$titleTxt'),
      ),

      drawer: OverlayWidget(),

      body: bodyContents,

      bottomNavigationBar: BottomMenuWidget(),

    );
  }
}

