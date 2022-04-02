// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter_weather_bloc/models/data_model.dart' as _i5;
import 'package:flutter_weather_bloc/screens/details_screen.dart' as _i2;
import 'package:flutter_weather_bloc/screens/landing_screen.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    LandingScreen.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.LandingScreen());
    },
    DetailsScreen.name: (routeData) {
      final args = routeData.argsAs<DetailsScreenArgs>();
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.DetailsScreen(key: args.key, dataModel: args.dataModel));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(LandingScreen.name, path: '/'),
        _i3.RouteConfig(DetailsScreen.name, path: '/details-screen')
      ];
}

/// generated route for
/// [_i1.LandingScreen]
class LandingScreen extends _i3.PageRouteInfo<void> {
  const LandingScreen() : super(LandingScreen.name, path: '/');

  static const String name = 'LandingScreen';
}

/// generated route for
/// [_i2.DetailsScreen]
class DetailsScreen extends _i3.PageRouteInfo<DetailsScreenArgs> {
  DetailsScreen({_i4.Key? key, required _i5.DataModel dataModel})
      : super(DetailsScreen.name,
            path: '/details-screen',
            args: DetailsScreenArgs(key: key, dataModel: dataModel));

  static const String name = 'DetailsScreen';
}

class DetailsScreenArgs {
  const DetailsScreenArgs({this.key, required this.dataModel});

  final _i4.Key? key;

  final _i5.DataModel dataModel;

  @override
  String toString() {
    return 'DetailsScreenArgs{key: $key, dataModel: $dataModel}';
  }
}
