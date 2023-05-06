import 'package:auto_route/auto_route.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/screens/home/home_unit_page.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')      
class AppRouter extends $AppRouter {
  @override      
  List<AutoRoute> get routes => [      
    AutoRoute(page: HomeMonthRoute.page, initial: true),
    AutoRoute(page: HomeWeekRoute.page),
    AutoRoute(page: HomeDayRoute.page),
    AutoRoute(page: HomeUnitRoute.page)
  ];
}