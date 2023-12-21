import 'package:chas/src/models/tea_model.dart';
import 'package:chas/src/repositories/teas_repository_interface.dart';
import 'package:flutter/cupertino.dart';

class TeasController {
  final ITeasRepository repository;
  TeasController({required this.repository});

  final scrollController = ScrollController();

  Future<List<TeaModel>> getTeaList() async {
    final teaList = await repository.getTeaList();
    return teaList;
  }
}
