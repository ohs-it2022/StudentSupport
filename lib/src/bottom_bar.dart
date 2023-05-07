import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/sample.dart';

@RoutePage()
class BottomBarRoute extends StatelessWidget {
  const BottomBarRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: bgColor1,
      routes: const [
        TabBarRoute(),
        AttendanceInfoRoute(),
        TaskRegistRoute(),
        TTChangeRoute(),
        SettingsRoute(),
      ], 
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          backgroundColor: bgColor2,
          // fixedColor: Colors.pink,
          unselectedItemColor: const Color.fromARGB(255, 118, 118, 118),
          selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          type: BottomNavigationBarType.fixed,
          currentIndex: tabsRouter.activeIndex,
          onTap: (int index) {
            // 選択中じゃないタブをTapした場合
            if (tabsRouter.activeIndex != index) {
              tabsRouter.setActiveIndex(index);
            }
            // 選択中のタブをTapした場合
            else {
              // ネストされたルーターのスタック情報を破棄
              tabsRouter
                  .innerRouterOf<StackRouter>(tabsRouter.current.name)
                  ?.popUntilRoot();
            }
          },
          items: [
            BottomNavigationBarItem(icon: Icon(homeIcon), label: 'ホーム'),
            BottomNavigationBarItem(icon: Icon(attendanceInfoIcon), label: '出欠情報'),
            BottomNavigationBarItem(icon: Icon(taskRegistIcon), label: '課題登録'),
            BottomNavigationBarItem(icon: Icon(timeTableChangeIcon), label: '時間割変更'),
            BottomNavigationBarItem(icon: Icon(settingIcon), label: '設定'),
          ],
        );
      }
    );
  }
}