// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:student_support/routers/root_router.dart' as _i1;
import 'package:student_support/src/app.dart' as _i2;
import 'package:student_support/src/screens/attend/attendanceInfo.dart' as _i3;
import 'package:student_support/src/screens/home/home_day_page.dart' as _i4;
import 'package:student_support/src/screens/home/home_month_page.dart' as _i5;
import 'package:student_support/src/screens/home/home_unit_page.dart' as _i6;
import 'package:student_support/src/screens/home/home_week_page.dart' as _i7;
import 'package:student_support/src/screens/register/add_detail.dart' as _i8;
import 'package:student_support/src/screens/register/taskRegist.dart' as _i9;
import 'package:student_support/src/screens/register/TT_change.dart' as _i10;
import 'package:student_support/src/screens/settings/settings.dart' as _i11;
import 'package:student_support/src/tab_bar.dart' as _i12;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    RootRouterRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.rootRouterPage(),
      );
    },
    OverlayElem.name: (routeData) {
      final args = routeData.argsAs<OverlayElemArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.OverlayElem(
          key: args.key,
          iconType: args.iconType,
          btnTxt: args.btnTxt,
          nextPage: args.nextPage,
        ),
      );
    },
    AttendanceInfoRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AttendanceInfoPage(),
      );
    },
    HomeDayRoute.name: (routeData) {
      final args = routeData.argsAs<HomeDayRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HomeDayPage(
          key: args.key,
          month: args.month,
          day: args.day,
        ),
      );
    },
    HomeMonthRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeMonthPage(),
      );
    },
    HomeUnitRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeUnitPage(),
      );
    },
    HomeWeekRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomeWeekPage(),
      );
    },
    AddDetailRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.AddDetailPage(),
      );
    },
    TaskRegistRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.TaskRegistPage(),
      );
    },
    TTChangeRouterRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.TTChangeRouterPage(),
      );
    },
    TTChangeRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.TTChangePage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SettingsPage(),
      );
    },
    TabBarRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.TabBarPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.rootRouterPage]
class RootRouterRoute extends _i13.PageRouteInfo<void> {
  const RootRouterRoute({List<_i13.PageRouteInfo>? children})
      : super(
          RootRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRouterRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.OverlayElem]
class OverlayElem extends _i13.PageRouteInfo<OverlayElemArgs> {
  OverlayElem({
    _i14.Key? key,
    required dynamic iconType,
    required String btnTxt,
    required dynamic nextPage,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          OverlayElem.name,
          args: OverlayElemArgs(
            key: key,
            iconType: iconType,
            btnTxt: btnTxt,
            nextPage: nextPage,
          ),
          initialChildren: children,
        );

  static const String name = 'OverlayElem';

  static const _i13.PageInfo<OverlayElemArgs> page =
      _i13.PageInfo<OverlayElemArgs>(name);
}

class OverlayElemArgs {
  const OverlayElemArgs({
    this.key,
    required this.iconType,
    required this.btnTxt,
    required this.nextPage,
  });

  final _i14.Key? key;

  final dynamic iconType;

  final String btnTxt;

  final dynamic nextPage;

  @override
  String toString() {
    return 'OverlayElemArgs{key: $key, iconType: $iconType, btnTxt: $btnTxt, nextPage: $nextPage}';
  }
}

/// generated route for
/// [_i3.AttendanceInfoPage]
class AttendanceInfoRoute extends _i13.PageRouteInfo<void> {
  const AttendanceInfoRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AttendanceInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'AttendanceInfoRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeDayPage]
class HomeDayRoute extends _i13.PageRouteInfo<HomeDayRouteArgs> {
  HomeDayRoute({
    _i14.Key? key,
    required int month,
    required int day,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          HomeDayRoute.name,
          args: HomeDayRouteArgs(
            key: key,
            month: month,
            day: day,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDayRoute';

  static const _i13.PageInfo<HomeDayRouteArgs> page =
      _i13.PageInfo<HomeDayRouteArgs>(name);
}

class HomeDayRouteArgs {
  const HomeDayRouteArgs({
    this.key,
    required this.month,
    required this.day,
  });

  final _i14.Key? key;

  final int month;

  final int day;

  @override
  String toString() {
    return 'HomeDayRouteArgs{key: $key, month: $month, day: $day}';
  }
}

/// generated route for
/// [_i5.HomeMonthPage]
class HomeMonthRoute extends _i13.PageRouteInfo<void> {
  const HomeMonthRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeMonthRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeMonthRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeUnitPage]
class HomeUnitRoute extends _i13.PageRouteInfo<void> {
  const HomeUnitRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeUnitRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeUnitRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeWeekPage]
class HomeWeekRoute extends _i13.PageRouteInfo<void> {
  const HomeWeekRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeWeekRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeWeekRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.AddDetailPage]
class AddDetailRoute extends _i13.PageRouteInfo<void> {
  const AddDetailRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AddDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddDetailRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.TaskRegistPage]
class TaskRegistRoute extends _i13.PageRouteInfo<void> {
  const TaskRegistRoute({List<_i13.PageRouteInfo>? children})
      : super(
          TaskRegistRoute.name,
          initialChildren: children,
        );

  static const String name = 'TaskRegistRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TTChangeRouterPage]
class TTChangeRouterRoute extends _i13.PageRouteInfo<void> {
  const TTChangeRouterRoute({List<_i13.PageRouteInfo>? children})
      : super(
          TTChangeRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'TTChangeRouterRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TTChangePage]
class TTChangeRoute extends _i13.PageRouteInfo<void> {
  const TTChangeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          TTChangeRoute.name,
          initialChildren: children,
        );

  static const String name = 'TTChangeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SettingsPage]
class SettingsRoute extends _i13.PageRouteInfo<void> {
  const SettingsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.TabBarPage]
class TabBarRoute extends _i13.PageRouteInfo<void> {
  const TabBarRoute({List<_i13.PageRouteInfo>? children})
      : super(
          TabBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabBarRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
