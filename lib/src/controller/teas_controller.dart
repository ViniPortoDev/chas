import 'package:chas/src/models/tea_categories_model.dart';
import 'package:chas/src/models/tea_model.dart';
import 'package:chas/src/repositories/teas_repository_interface.dart';

class TeasController {
  final ITeasRepository repository;
  TeasController({required this.repository});

  final List<TeaCategoriesModel> teaCategories = [
    TeaCategoriesModel(
      title: 'Medicinais',
      imageUrl:
          'https://blog.plantei.com.br/wp-content/uploads/2017/10/Principais-Plantas-Medicinais-Capa.jpg',
      subcategories: [
        'antioxidante',
        'imunidade',
        'anti-inflamatório',
        'náuseas',
        'pressão arterial',
        'dores de estômago',
        'melhora da memória',
        'alívio do estresse',
        'adaptogênico',
      ],
    ),
    TeaCategoriesModel(
      title: 'Emagrecedores',
      imageUrl:
          'https://www.cirurgiaestetica.com.br/wp-content/uploads/2021/03/chas-emagrecedores-funcionam-mesmo-img-1.jpg.webp',
      subcategories: ['emagrecedor'],
    ),
    TeaCategoriesModel(
      title: 'Digestivos',
      imageUrl:
          'https://rescaroli.com.br/wp-content/uploads/2023/09/conheca-as-melhores-opcoes-de-chas-para-auxiliar-a-digestao.jpg',
      subcategories: ['digestão', 'alívio estomacal'],
    ),
    TeaCategoriesModel(
      title: 'Calmante',
      imageUrl:
          'https://www.receiteria.com.br/wp-content/uploads/receitas-de-chas-calmantes-1.jpg',
      subcategories: ['relaxamento', 'calmante', 'sono'],
    ),
    TeaCategoriesModel(
      title: 'Estimulantes',
      imageUrl:
          'https://blog.vhita.com.br/wp-content/uploads/2018/01/chas-estimulantes-opt.jpg',
      subcategories: ['estimulante', 'energizante', 'reconfortante'],
    ),
    TeaCategoriesModel(
      title: 'Revigorantes',
      imageUrl:
          'https://img.freepik.com/fotos-premium/cha-masala-cha-revigorante-com-especiarias-ingredientes-na-placa-fundo-de-textura-escura_125367-224.jpg',
      subcategories: [
        'revigorante',
        'energizante',
      ],
    ),
    TeaCategoriesModel(
      title: 'Nutritivos',
      imageUrl:
          'https://conteudo.imguol.com.br/c/entretenimento/21/2020/03/13/chas-e-infusao-1584138252891_v2_450x450.jpg',
      subcategories: ['vitaminas', 'nutritivo', 'nutricional'],
    ),
    TeaCategoriesModel(
      title: 'Sabor e Aroma',
      imageUrl:
          'https://www.merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/alt-59c4207ecf106-4287-6e852c75b71c74a47499daa3d6a7396d@1x.jpg',
      subcategories: [
        'cítrico',
        'adoçicado',
        'aroma floral',
        'frutado',
        'picante',
        'doce',
        'quente',
      ],
    ),
    TeaCategoriesModel(
      title: 'Outros',
      imageUrl:
          'https://chacamelia.com/admin/wp-content/uploads/2022/04/cafeina-no-cha--1024x683.jpg',
      subcategories: [
        'sem cafeína',
        'terroso',
        'chá branco',
        'delicado',
        'leve',
        'robusto',
        'cafeína',
        'herbal',
      ],
    ),
  ];

  Future<List<TeaModel>> getTeaList() async {
    final teaList = await repository.getTeaList();
    return teaList;
  }

    Future<List<TeaModel>> getTeasTypeThat(String filter) async {
    // fetch all teas
    List<TeaModel> teas = await getTeaList();
    // filter in all teas
    List<TeaModel> outputList = teas.where((tea) => tea.type.contains(filter)).toList();
    return outputList;
  }
}
