import 'dart:async';

import 'package:chas/src/blocs/teas_event.dart';
import 'package:chas/src/blocs/teas_states.dart';
import 'package:chas/src/controller/teas_controller.dart';
import 'package:chas/src/models/tea_model.dart';
import 'package:chas/src/repositories/teas_local_repository.dart';

class TeasBloc {
  // TODO: deveria estar pegando referência ao controller?
  final localRepository = TeasLocalRepository();
  final teasController = TeasController(repository: TeasLocalRepository());

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
      // TODO: ao invés de pegar todos os chás, pegue um filtro dos primeiros x
      // ao scrollar a view, filtre por mais x chás
      teaList = await localRepository.getAllTeas();
    }
    if (event is FilterTeasEvent) {
      // TODO: pegar lista filtrada
      teaList = await teasController.getTeasTypeThat(event.filter);
    }
    _outputController.add(TeasSuccessStates(teaList: teaList));
  }
}
