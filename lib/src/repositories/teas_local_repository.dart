import 'dart:convert';

import 'package:chas/src/models/tea_model.dart';
import 'package:chas/src/repositories/teas_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class TeasLocalRepository implements ITeasRepository {
  final List<TeaModel> teas = [];

  Future<List<TeaModel>> getAllTeas() async {


    String teaListJson = await rootBundle.loadString('lib/src/mock/teas.json');

    final Map<String, dynamic> teaMap = jsonDecode(teaListJson);

    for (var res in teaMap['teas']) {
      final tea = TeaModel.fromMap(res);
      teas.add(tea);
    }

    return teas;
  }

  Future<List<TeaModel>> searchTeas(String filter) async {
    if (filter == '') {
      return teas;
    }
    List<TeaModel> outputList = teas
        .where((tea) => tea.title.toLowerCase().contains(filter.toLowerCase()))
        .toList();

    return outputList;
  }

  Future<List<TeaModel>> teasPerCategory( String category) async {
    List<TeaModel> listFiteredTeas = [];

   

    for (var tea in teas) {
      if (tea.categories.contains(category)) {
        listFiteredTeas.add(tea);
      }
    }
    return listFiteredTeas;
  }

  @override
  Future<List<TeaModel>> getTeaList() async {
    return await getAllTeas();
  }
}
