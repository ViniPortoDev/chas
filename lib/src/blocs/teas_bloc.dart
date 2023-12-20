import 'dart:async';

import 'package:chas/src/blocs/teas_event.dart';
import 'package:chas/src/blocs/teas_states.dart';
import 'package:chas/src/models/tea_model.dart';
import 'package:chas/src/repositories/teas_local_repository.dart';

class TeasBloc {
  final localRepository = TeasLocalRepository();

  final StreamController<TeasEvent> _inputController =
      StreamController<TeasEvent>();
  final StreamController<TeasStates> _outputController =
      StreamController<TeasStates>();

  Sink<TeasEvent> get inputTeas => _inputController.sink;
  Stream<TeasStates> get stream => _outputController.stream;

  TeasBloc() {
    _inputController.stream.listen(_mapEventToState);
  }

  _mapEventToState(TeasEvent event) async {
    List<TeaModel> teaList = [];
    if (event is LoadTeasEvent) {
      teaList = await localRepository.getAllTeas();
    }
    _outputController.add(TeasSuccessStates(teaList: teaList));
  }
}
