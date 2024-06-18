import 'package:chas/src/models/tea_model.dart';

abstract class TeasStates {}

class TeasInitialState extends TeasStates {}

class LoadingTeasState extends TeasStates {}

class TeasSuccessStates extends TeasStates {
  final List<TeaModel> teaList;
  TeasSuccessStates({required this.teaList});
}

class TeasErrorState extends TeasStates {
  final String error;
  TeasErrorState({required this.error});
}
