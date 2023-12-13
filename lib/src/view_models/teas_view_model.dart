import 'package:chas/src/models/tea_category_model.dart';
import 'package:chas/src/models/tea_model.dart';
import 'package:chas/src/repositories/teas_repository_interface.dart';

class TeasViewModel {
  final ITeasRepository repository;
  TeasViewModel({required this.repository});

  Future<List<TeaModel>> getTeaList() async {
    final teaList = await repository.getTeaList();
    return teaList;
  }

  List<TeaCategory> teas = [
    TeaCategory(teaImage: 'assets/images/cha_1.jpg', teaTitle: 'Emagrecedores'),
    TeaCategory(teaImage: 'assets/images/cha_2.jpg', teaTitle: 'Relaxamento'),
    TeaCategory(teaImage: 'assets/images/cha_3.jpg', teaTitle: 'Digestão'),
    TeaCategory(teaImage: 'assets/images/cha_4.jpg', teaTitle: 'Alivios'),
  ];
}
