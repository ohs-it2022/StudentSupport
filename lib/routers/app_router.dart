import 'package:auto_route/auto_route.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/screens/home/home_unit_page.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')      
class AppRouter extends $AppRouter {
  @override      
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      // initial: true,
      page: TabBarRoute.page,
      children: [
        AutoRoute(page: HomeMonthRoute.page, path: 'month', initial: true),
        AutoRoute(page: HomeWeekRoute.page, path: 'week'),
        AutoRoute(page: HomeDayRoute.page, path: 'day'),
        AutoRoute(page: HomeUnitRoute.page, path: 'unit')
      ]
    ),
    // AutoRoute(page: HomeMonthRoute.page, initial: true),
  ];
}