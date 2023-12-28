import 'package:chas/src/models/tea_model.dart';

abstract class TeasStates {
  List<TeaModel> teaList;
  TeasStates({required this.teaList});
}

class TeasInitialState extends TeasStates {
  TeasInitialState() : super(teaList: []);
}

class TeasLoadState extends TeasStates {
  TeasLoadState() : super(teaList: []);
}

class TeasSuccessStates extends TeasStates {
  TeasSuccessStates({required List<TeaModel> teaList})
      : super(teaList: teaList);
}
