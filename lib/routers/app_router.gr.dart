// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:student_support/routers/root_router.dart' as _i1;
import 'package:student_support/src/app.dart' as _i2;
import 'package:student_support/src/screens/home/home_day_page.dart' as _i3;
import 'package:student_support/src/screens/home/home_month_page.dart' as _i4;
import 'package:student_support/src/screens/home/home_unit_page.dart' as _i5;
import 'package:student_support/src/screens/register/add_detail.dart' as _i6;
import 'package:student_support/src/screens/register/taskRegist.dart' as _i7;
import 'package:student_support/src/screens/settings/settings.dart' as _i8;
import 'package:student_support/src/screens/timeTable/timeTable.dart' as _i10;
import 'package:student_support/src/screens/timeTable/TT_change.dart' as _i11;
import 'package:student_support/src/tab_bar.dart' as _i9;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    RootRouterRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.rootRouterPage(),
      );
    },
    OverlayElem.name: (routeData) {
      final args = routeData.argsAs<OverlayElemArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.OverlayElem(
          key: args.key,
          iconType: args.iconType,
          btnTxt: args.btnTxt,
          nextPage: args.nextPage,
        ),
      );
    },
    HomeDayRoute.name: (routeData) {
      final args = routeData.argsAs<HomeDayRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HomeDayPage(
          key: args.key,
          month: args.month,
          day: args.day,
          weekday: args.weekday,
        ),
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
    AddDetailRoute.name: (routeData) {
      final args = routeData.argsAs<AddDetailRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.AddDetailPage(
          key: args.key,
          num: args.num,
          dayOfWeek: args.dayOfWeek,
          weekTimeTable: args.weekTimeTable,
        ),
      );
    },
    TaskRegistRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.TaskRegistPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SettingsPage(),
      );
    },
    TabBarRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.TabBarPage(),
      );
    },
    TimeTableRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.TimeTablePage(),
      );
    },
    TTChangeRouterRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.TTChangeRouterPage(),
      );
    },
    TTChangeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.TTChangePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.rootRouterPage]
class RootRouterRoute extends _i12.PageRouteInfo<void> {
  const RootRouterRoute({List<_i12.PageRouteInfo>? children})
      : super(
          RootRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRouterRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.OverlayElem]
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
/// [_i3.HomeDayPage]
class HomeDayRoute extends _i12.PageRouteInfo<HomeDayRouteArgs> {
  HomeDayRoute({
    _i13.Key? key,
    required int month,
    required int day,
    required dynamic weekday,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          HomeDayRoute.name,
          args: HomeDayRouteArgs(
            key: key,
            month: month,
            day: day,
            weekday: weekday,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDayRoute';

  static const _i12.PageInfo<HomeDayRouteArgs> page =
      _i12.PageInfo<HomeDayRouteArgs>(name);
}

class HomeDayRouteArgs {
  const HomeDayRouteArgs({
    this.key,
    required this.month,
    required this.day,
    required this.weekday,
  });

  final _i13.Key? key;

  final int month;

  final int day;

  final dynamic weekday;

  @override
  String toString() {
    return 'HomeDayRouteArgs{key: $key, month: $month, day: $day, weekday: $weekday}';
  }
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
/// [_i6.AddDetailPage]
class AddDetailRoute extends _i12.PageRouteInfo<AddDetailRouteArgs> {
  AddDetailRoute({
    _i13.Key? key,
    required int num,
    required int dayOfWeek,
    required dynamic weekTimeTable,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          AddDetailRoute.name,
          args: AddDetailRouteArgs(
            key: key,
            num: num,
            dayOfWeek: dayOfWeek,
            weekTimeTable: weekTimeTable,
          ),
          initialChildren: children,
        );

  static const String name = 'AddDetailRoute';

  static const _i12.PageInfo<AddDetailRouteArgs> page =
      _i12.PageInfo<AddDetailRouteArgs>(name);
}

class AddDetailRouteArgs {
  const AddDetailRouteArgs({
    this.key,
    required this.num,
    required this.dayOfWeek,
    required this.weekTimeTable,
  });

  final _i13.Key? key;

  final int num;

  final int dayOfWeek;

  final dynamic weekTimeTable;

  @override
  String toString() {
    return 'AddDetailRouteArgs{key: $key, num: $num, dayOfWeek: $dayOfWeek, weekTimeTable: $weekTimeTable}';
  }
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
/// [_i8.SettingsPage]
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
/// [_i9.TabBarPage]
class TabBarRoute extends _i12.PageRouteInfo<void> {
  const TabBarRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TabBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabBarRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TimeTablePage]
class TimeTableRoute extends _i12.PageRouteInfo<void> {
  const TimeTableRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TimeTableRoute.name,
          initialChildren: children,
        );

  static const String name = 'TimeTableRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.TTChangeRouterPage]
class TTChangeRouterRoute extends _i12.PageRouteInfo<void> {
  const TTChangeRouterRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TTChangeRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'TTChangeRouterRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.TTChangePage]
class TTChangeRoute extends _i12.PageRouteInfo<void> {
  const TTChangeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TTChangeRoute.name,
          initialChildren: children,
        );

  static const String name = 'TTChangeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
