import '../models/tea_model.dart';

abstract class ITeasRepository {
  Future<List<TeaModel>> getTeaList();
  Future<List<TeaModel>> getTeasTypeThat(String filter);
}
