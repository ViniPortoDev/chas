import 'dart:convert';

import 'package:chas/src/models/tea_model.dart';
import 'package:chas/src/repositories/teas_repository_interface.dart';
import 'package:flutter/services.dart' show rootBundle;

class TeasRepository implements ITeasRepository {
  final teaList = <TeaModel>[];
  @override
  Future<List<TeaModel>> getTeaList() async {
    String teaListJson = await rootBundle.loadString('lib/src/mock/teas.json');
//  final zap = where
    // final teaMap = jsonDecode(teaListJson);
    // teaList.add(TeaModel.fromMap(teaMap['teas']));
    print(teaList);
    return teaList;
  }
}
