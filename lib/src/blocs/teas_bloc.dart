import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chas/src/blocs/teas_event.dart';
import 'package:chas/src/blocs/teas_states.dart';
import 'package:chas/src/repositories/teas_local_repository.dart';

class TeasBloc extends Bloc<TeasEvent, TeasStates> {
  final _localRepository = TeasLocalRepository();

  TeasBloc() : super(TeasInitialState()) {
    on<LoadTeasEvent>((event, emit) async {
      emit(LoadingTeasState());
      await Future.delayed(const Duration(seconds: 3));
      try {
        emit(TeasSuccessStates(teaList: await _localRepository.getAllTeas()));
      } catch (e) {
        emit(TeasErrorState(error: e.toString()));
      }
    });
    on<SearchTeasEvent>((event, emit) async {
      emit(LoadingTeasState());
      await Future.delayed(const Duration(milliseconds: 500));
      try {
        emit(TeasSuccessStates(
            teaList: await _localRepository.searchTeas(event.query)));
      } catch (e) {
        emit(TeasErrorState(error: e.toString()));
      }
    });

    on<TeasFilterEvent>((event, emit) async {
      emit(LoadingTeasState());
      await Future.delayed(const Duration(seconds: 3));
      try {
        emit(TeasSuccessStates(
            teaList: await _localRepository.teasPerCategory(event.category)));
      } catch (e) {
        emit(TeasErrorState(error: e.toString()));
      }
    });
  }


}
