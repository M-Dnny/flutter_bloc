import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_bloc/bloc/game_data_bloc.dart';
import 'package:flutter_weather_bloc/repo/game_repo.dart';
import 'package:flutter_weather_bloc/routes/custom_router.gr.dart';

void main() {
  runApp(BlocProvider<GameDataBloc>(
    create: (context) => GameDataBloc(GamesRepo()),
    child: MyApp(),
  ));
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
