import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/app.dart';
import 'package:student_support/src/bottom_bar.dart';
import 'package:student_support/src/sample.dart';


@RoutePage()
class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: [
        HomeMonthRoute(),
        HomeWeekRoute(),
        HomeDayRoute(month: today.month, day: today.day, weekday: today.weekday),
        HomeUnitRoute(),
      ],
      builder: (context, child, controller) {
        // final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          // backgroundColor: bgColor1,
          appBar: AppBar(
            title: const Text('ホーム'),
            bottom: TabBar(            
              controller: controller,            
              tabs: const [            
                Tab(text: '月'),            
                Tab(text: '週'),            
                Tab(text: '日'),
                Tab(text: '単元')       
              ],
            ),
          ),
          drawer: const OverlayWidget(),
          body: Column(children: [
            Expanded(child: child),
            const BottomBar(selected: 1,)
          ])
        );
      }
    );
  }
}