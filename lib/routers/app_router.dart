import 'package:auto_route/auto_route.dart';
import 'package:student_support/routers/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')      
class AppRouter extends $AppRouter {
  @override      
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: RootRouterRoute.page,
      children: [
        AutoRoute(
          page: TabBarRoute.page, 
          path: 'home', 
          initial: true,
          children: [
            AutoRoute(page: HomeMonthRoute.page, path: 'month', initial: true),
            AutoRoute(page: HomeDayRoute.page, path: 'day'),
            AutoRoute(page: HomeUnitRoute.page, path: 'unit')
          ]
        ),
        AutoRoute(page: TimeTableRoute.page, path: 'attend'),
        AutoRoute(page: SettingsRoute.page, path: 'settings'),
        AutoRoute(page: TaskRegistRoute.page, path: 'task'),
        AutoRoute(
          page: TTChangeRouterRoute.page, 
          path: 'timetableChangeRouter', 
          children: [
            AutoRoute(page: TTChangeRoute.page, path: 'timetableChange', initial: true),
            AutoRoute(page: AddDetailRoute.page, path: 'add_detail')  
          ]
        ),
      ]
    ),
  ];
}