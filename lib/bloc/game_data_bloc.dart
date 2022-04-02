import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_weather_bloc/models/data_model.dart';
import 'package:flutter_weather_bloc/repo/game_repo.dart';

part 'game_data_event.dart';
part 'game_data_state.dart';

class GameDataBloc extends Bloc<GameDataEvent, GameDataState> {
  final GamesRepo gamesRepo;

  GameDataBloc(
    this.gamesRepo,
  ) : super(GameDataInitialState()) {
    on<GameDataEvent>((event, emit) async {
      if (event is LoadGameDataEvent) {
        emit(GameDataLoadingState());
        List<DataModel>? apiResult = await gamesRepo.getGamesData();
        if (apiResult == null) {
          emit(GameDataErrorState());
        } else {
          emit(GameDataLoadedState(apiResult: apiResult));
        }
      }
    });
  }
}
