import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/src/bottom_bar.dart';
import 'package:student_support/src/sample.dart';
import 'package:app_settings/app_settings.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const double widgetMargin = 40.0;
    final double widgetHeight = (screenSize.height - widgetMargin*3 - 240) / 4;

    // テーマ選択
    Container themeSelector = Container(
      decoration: BoxDecoration(color: bgColor1, borderRadius: BorderRadius.circular(10)),
      height: widgetHeight,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, widgetMargin),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: const Center(
          child: Row(
            children: [
              Expanded(child: Text('テーマ', style: TextStyle(fontSize: 22))),
              DropdownButtonMenu(menuElem: ['ダーク','ライト', '端末'])
            ]
          )
        )
      )
    );


    // 初期画面選択
    Container topPageSelector = Container(
      decoration: BoxDecoration(color: bgColor1, borderRadius: BorderRadius.circular(10)),
      height: widgetHeight,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, widgetMargin),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: const Center(
          child: Row(
            children: [
              Expanded(child: Text('起動時', style: TextStyle(fontSize: 22))),
              DropdownButtonMenu(menuElem: ['日次(デフォルト)','週次'])
            ]
          )
        )
      )
    );


    // 時間割選択
    Container timeTableSelector = Container(
      decoration: BoxDecoration(color: bgColor1, borderRadius: BorderRadius.circular(10)),
      height: widgetHeight,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, widgetMargin),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: const Center(
          child: Row(
            children: [
              Expanded(child: Text('時間割', style: TextStyle(fontSize: 22))),
              DropdownButtonMenu(menuElem: ['時間割１','時間割２'])
            ]
          )
        )
      )
    );


    // 通知設定画面へのボタン
    ElevatedButton reminderSetting = ElevatedButton(
      onPressed: () {
        AppSettings.openNotificationSettings();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15.0
        ),
      ),
      child: const Center(child: Text('通知設定 ▸', style: TextStyle(fontSize: 22))),
    );


    // 設定のエリアを用意
    Center body = Center(
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              decoration: BoxDecoration(color: bgColor2, borderRadius: BorderRadius.circular(20)),
              child: Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(30, 40, 30, 40),
                  child: Column(
                    children: [ // 各パーツを配置
                      themeSelector,
                      topPageSelector,
                      timeTableSelector,
                      reminderSetting,
                    ]
                  )
                )
              )
            )
          ),
          const BottomBar()
        ],
      )
    );

    return ScreenWidget(
      titleTxt: '設定', 
      bodyContents: body,
      drawerFlg: 1,
    );
  }
}