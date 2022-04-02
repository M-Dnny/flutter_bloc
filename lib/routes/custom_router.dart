import 'package:auto_route/annotations.dart';
import 'package:flutter_weather_bloc/screens/details_screen.dart';
import 'package:flutter_weather_bloc/screens/landing_screen.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LandingScreen, initial: true),
    AutoRoute(page: DetailsScreen)
  ],
)
class $AppRouter {}
