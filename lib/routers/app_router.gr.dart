// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:student_support/src/screens/attend/attendanceInfo.dart' as _i1;
import 'package:student_support/src/screens/home/home_day_page.dart' as _i2;
import 'package:student_support/src/screens/home/home_month_page.dart' as _i3;
import 'package:student_support/src/screens/home/home_unit_page.dart' as _i4;
import 'package:student_support/src/screens/home/home_week_page.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AttendanceInfoRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AttendanceInfoPage(),
      );
    },
    HomeDayRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeDayPage(),
      );
    },
    HomeMonthRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeMonthPage(),
      );
    },
    HomeUnitRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeUnitPage(),
      );
    },
    HomeWeekRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeWeekPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AttendanceInfoPage]
class AttendanceInfoRoute extends _i6.PageRouteInfo<void> {
  const AttendanceInfoRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AttendanceInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'AttendanceInfoRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeDayPage]
class HomeDayRoute extends _i6.PageRouteInfo<void> {
  const HomeDayRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeDayRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeDayRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeMonthPage]
class HomeMonthRoute extends _i6.PageRouteInfo<void> {
  const HomeMonthRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeMonthRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeMonthRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeUnitPage]
class HomeUnitRoute extends _i6.PageRouteInfo<void> {
  const HomeUnitRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeUnitRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeUnitRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeWeekPage]
class HomeWeekRoute extends _i6.PageRouteInfo<void> {
  const HomeWeekRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeWeekRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeWeekRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
