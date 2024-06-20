import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chas/src/blocs/teas_event.dart';
import 'package:chas/src/blocs/teas_states.dart';
import 'package:chas/src/models/tea_model.dart';
import 'package:chas/src/repositories/teas_local_repository.dart';

class TeasBloc extends Bloc<TeasEvent, TeasStates> {
  final _localRepository = TeasLocalRepository();

  // final StreamController<TeasEvent> _inputController =
  //     StreamController<TeasEvent>();
  // final StreamController<TeasStates> _outputController =
  //     StreamController<TeasStates>();

  // Sink<TeasEvent> get inputTeas => _inputController.sink;
  // Stream<TeasStates> get stream => _outputController.stream;

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
      await Future.delayed(const Duration(seconds: 5));
      try {
        emit(TeasSuccessStates(
            teaList: await _localRepository.searchTeas(event.query)));
      } catch (e) {
        emit(TeasErrorState(error: e.toString()));
      }
    });
  }

  // _mapEventToState(TeasEvent event) async {
  //   List<TeaModel> teaList = [];
  //   if (event is LoadTeasEvent) {
  //     teaList = await localRepository.getAllTeas();
  //   } else if (event is SearchTeasEvent) {
  //     final searchResults = await localRepository.searchTeas(event.query);
  //     _outputController.add(TeasSuccessStates(teaList: searchResults));
  //     teaList = searchResults;
  //   }
  //   _outputController.add(TeasSuccessStates(teaList: teaList));
  // }
}
