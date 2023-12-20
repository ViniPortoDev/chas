import 'dart:convert';

import 'package:chas/src/models/tea_model.dart';
import 'package:chas/src/repositories/teas_repository_interface.dart';
import 'package:flutter/services.dart' show rootBundle;

class TeasFireRepository implements ITeasRepository {
  final teaList = <TeaModel>[];
  @override
  Future<List<TeaModel>> getTeaList() async {
    // var cachedTeas = myteas[:10]
    // cachedTeas += myteas[+:10]

    // const collection = "teas";
    // const firebase = Firestore.instance.firestore.get(collection)
    String teasFire = "";

    // tratamento do teasFire
    final Map<String, dynamic> teaMap = jsonDecode(teasFire);

    // for (var res in teaMap['teas']) {
    //   final tea = TeaModel.fromMap(res);
    //   teaList.add(tea);
    // }

    return teaList;
  }
  
  @override
  Future<List<TeaModel>> getTeasTypeThat(String filter) {
    // TODO: implement getTeasTypeThat
    throw UnimplementedError();
  }
}
