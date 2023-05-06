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
      routes: const [
        TabBarRoute(),
        AttendanceInfoRoute(),
        SettingsRoute(),
        TaskRegistRoute(),
        TTChangeRoute()
      ], 
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          backgroundColor: Colors.black,
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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          ],
        );
      }
    );
  }
}