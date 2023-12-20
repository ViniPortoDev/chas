import 'package:chas/src/models/tea_model.dart';
import 'package:chas/src/repositories/teas_local_repository.dart';
import 'package:chas/src/controller/teas_controller.dart';
import 'package:chas/src/views/home/widgets/tea_box_category_widget.dart';
import 'package:chas/src/views/home/widgets/tea_box_widget.dart';
import 'package:chas/src/views/home/widgets/tea_userbar_widget.dart';
import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import 'widgets/tea_search_bar_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final ValueNotifier<List<TeaModel>> teaList;

  @override
  void initState() {
    super.initState();
    getAllTeas();
  }

  Future<List<TeaModel>> getAllTeas() async {
    teaList.value = await controller.getTeaList();
    return teaList.value;
  }

  final controller = TeasController(repository: TeasLocalRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffececdc),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 12,
                left: 12,
                right: 12,
              ),
              child: Column(
                children: [
                  TeaUserbarWidget(
                    userName: 'Vinicius',
                  ),
                  SizedBox(height: 20),
                  TeaSearchBarWidget(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categorias',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Ver tudo',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.separated(
                itemCount: 10,
                padding: const EdgeInsets.only(left: 12),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return const TeaBoxCategoryWidget(
                    teaPhoto: 'assets/images/cha_2.jpg',
                    teaTitle: 'Farm',
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Medicinais',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ValueListenableBuilder(
                    valueListenable: teaList,
                    builder: (context, teaList, child) {
                      if (teaList == null) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: teaList.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (BuildContext context, int index) =>
                            TeaBoxWidget(
                          description: teaList[index].description,
                          teaImage: teaList[index].imagemUrl,
                          onTap: () =>
                              Navigator.pushNamed(context, Routes.infoTea),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
