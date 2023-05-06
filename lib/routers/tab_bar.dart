import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/sample.dart';
import 'package:student_support/src/screens/home/home_month_page.dart';

@RoutePage()
class TabBarRoute extends StatelessWidget {
  const TabBarRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        HomeMonthRoute(),
        HomeWeekRoute(),
        HomeDayRoute(),
        HomeUnitRoute(),
      ],
      builder: (context, child, controller) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          backgroundColor: bgColor1,
          appBar: AppBar(
            title: Text('ホーム'),
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
          body: child,
        );
      }
    );
  }
}