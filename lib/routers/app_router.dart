import 'package:auto_route/auto_route.dart';
import 'package:student_support/routers/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')      
class AppRouter extends $AppRouter {
  @override      
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: TabBarRoute.page,
      children: [
        AutoRoute(page: HomeMonthRoute.page, path: 'month', initial: true),
        AutoRoute(page: HomeWeekRoute.page, path: 'week'),
        AutoRoute(page: HomeDayRoute.page, path: 'day'),
        AutoRoute(page: HomeUnitRoute.page, path: 'unit')
      ]
    ),
  ];
}