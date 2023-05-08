// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:student_support/src/app.dart' as _i1;
import 'package:student_support/src/bottom_bar.dart' as _i10;
import 'package:student_support/src/screens/attend/attendanceInfo.dart' as _i2;
import 'package:student_support/src/screens/home/home_day_page.dart' as _i3;
import 'package:student_support/src/screens/home/home_month_page.dart' as _i4;
import 'package:student_support/src/screens/home/home_unit_page.dart' as _i5;
import 'package:student_support/src/screens/home/home_week_page.dart' as _i6;
import 'package:student_support/src/screens/register/taskRegist.dart' as _i7;
import 'package:student_support/src/screens/register/TT_change.dart' as _i8;
import 'package:student_support/src/screens/settings/settings.dart' as _i9;
import 'package:student_support/src/tab_bar.dart' as _i11;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    OverlayElem.name: (routeData) {
      final args = routeData.argsAs<OverlayElemArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.OverlayElem(
          key: args.key,
          iconType: args.iconType,
          btnTxt: args.btnTxt,
          nextPage: args.nextPage,
        ),
      );
    },
    AttendanceInfoRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AttendanceInfoPage(),
      );
    },
    HomeDayRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeDayPage(),
      );
    },
    HomeMonthRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeMonthPage(),
      );
    },
    HomeUnitRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeUnitPage(),
      );
    },
    HomeWeekRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeWeekPage(),
      );
    },
    TaskRegistRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.TaskRegistPage(),
      );
    },
    TTChangeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.TTChangePage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SettingsPage(),
      );
    },
    BottomBarRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.BottomBarRoute(),
      );
    },
    TabBarRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.TabBarRoute(),
      );
    },
  };
}

/// generated route for
/// [_i1.OverlayElem]
class OverlayElem extends _i12.PageRouteInfo<OverlayElemArgs> {
  OverlayElem({
    _i13.Key? key,
    required dynamic iconType,
    required String btnTxt,
    required dynamic nextPage,
    List<_i12.PageRouteInfo>? children,
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

  static const _i12.PageInfo<OverlayElemArgs> page =
      _i12.PageInfo<OverlayElemArgs>(name);
}

class OverlayElemArgs {
  const OverlayElemArgs({
    this.key,
    required this.iconType,
    required this.btnTxt,
    required this.nextPage,
  });

  final _i13.Key? key;

  final dynamic iconType;

  final String btnTxt;

  final dynamic nextPage;

  @override
  String toString() {
    return 'OverlayElemArgs{key: $key, iconType: $iconType, btnTxt: $btnTxt, nextPage: $nextPage}';
  }
}

/// generated route for
/// [_i2.AttendanceInfoPage]
class AttendanceInfoRoute extends _i12.PageRouteInfo<void> {
  const AttendanceInfoRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AttendanceInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'AttendanceInfoRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeDayPage]
class HomeDayRoute extends _i12.PageRouteInfo<void> {
  const HomeDayRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeDayRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeDayRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeMonthPage]
class HomeMonthRoute extends _i12.PageRouteInfo<void> {
  const HomeMonthRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeMonthRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeMonthRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeUnitPage]
class HomeUnitRoute extends _i12.PageRouteInfo<void> {
  const HomeUnitRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeUnitRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeUnitRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeWeekPage]
class HomeWeekRoute extends _i12.PageRouteInfo<void> {
  const HomeWeekRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeWeekRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeWeekRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.TaskRegistPage]
class TaskRegistRoute extends _i12.PageRouteInfo<void> {
  const TaskRegistRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TaskRegistRoute.name,
          initialChildren: children,
        );

  static const String name = 'TaskRegistRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.TTChangePage]
class TTChangeRoute extends _i12.PageRouteInfo<void> {
  const TTChangeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TTChangeRoute.name,
          initialChildren: children,
        );

  static const String name = 'TTChangeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SettingsPage]
class SettingsRoute extends _i12.PageRouteInfo<void> {
  const SettingsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.BottomBarRoute]
class BottomBarRoute extends _i12.PageRouteInfo<void> {
  const BottomBarRoute({List<_i12.PageRouteInfo>? children})
      : super(
          BottomBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomBarRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.TabBarRoute]
class TabBarRoute extends _i12.PageRouteInfo<void> {
  const TabBarRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TabBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabBarRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
