import 'dart:convert';

import 'package:chas/src/models/tea_model.dart';
import 'package:chas/src/repositories/teas_repository_interface.dart';
import 'package:flutter/services.dart' show rootBundle;

class TeasRepository implements ITeasRepository {
  final teaList = <TeaModel>[];
  @override
  Future<List<TeaModel>> getTeaList() async {
    String teaListJson = await rootBundle.loadString('lib/src/mock/teas.json');
    final Map<String, dynamic> teaMap = jsonDecode(teaListJson);

    for (var res in teaMap['teas']) {
      final tea = TeaModel.fromMap(res);
      teaList.add(tea);
    }

    return teaList;
  }
}
