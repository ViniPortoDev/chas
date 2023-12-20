import 'package:chas/src/models/tea_model.dart';
import 'package:chas/src/repositories/teas_repository_interface.dart';


class TeasController {
  final ITeasRepository repository;
  TeasController({required this.repository});

 

  Future<List<TeaModel>> getTeaList() async {
    final teaList = await repository.getTeaList();
    return teaList;
  }
}
