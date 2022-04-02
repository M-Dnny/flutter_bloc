// ignore_for_file: avoid_print

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_bloc/bloc/game_data_bloc.dart';
import 'package:flutter_weather_bloc/models/data_model.dart';
import 'package:flutter_weather_bloc/routes/custom_router.dart';
import 'package:flutter_weather_bloc/routes/custom_router.gr.dart';
import 'package:glassmorphism/glassmorphism.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<GameDataBloc, GameDataState>(
          builder: (context, state) {
            // context.read<GameDataBloc>().add(GameDataLoading());
            if (state is GameDataInitialState) {
              context.read<GameDataBloc>().add(LoadGameDataEvent());
              print("GameDataInitialState");
              return const CircularProgressIndicator();
            } else if (state is GameDataLoadingState) {
              print("GameDataLoadingState");
              return const Center(child: CircularProgressIndicator());
            } else if (state is GameDataLoadedState) {
              print("GameDataLoadedState");
              return buildGameModel(state.apiResult);
            } else if (state is GameDataErrorState) {
              return const Center(
                child: Text("Uh oh! 😭 Something went wrong!"),
              );
            }
            return const Text("Error");
          },
        ),
      ),
    );
  }
}

Widget buildGameModel(List<DataModel> apiResult) {
  return ListView.builder(
    padding: EdgeInsets.zero,
    itemCount: apiResult.length,
    itemBuilder: (BuildContext context, int index) {
      final DataModel dataModel = apiResult[index];
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
        child: InkWell(
          onTap: () {
            context.router.push(DetailsScreen(dataModel: dataModel));
          },
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    height: 230,
                    width: MediaQuery.of(context).size.width / 1.05,
                    fit: BoxFit.cover,
                    image: NetworkImage(dataModel.image),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width / 1.05,
                    height: 120,
                    border: 0,
                    borderRadius: 0,
                    blur: 20,
                    alignment: Alignment.bottomCenter,
                    linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.1),
                        const Color(0xFFFFFFFF).withOpacity(0.05),
                      ],
                      stops: const [
                        0.1,
                        1,
                      ],
                    ),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.5),
                        const Color((0xFFFFFFFF)).withOpacity(0.5),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              dataModel.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Platforms: " + dataModel.platforms,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
