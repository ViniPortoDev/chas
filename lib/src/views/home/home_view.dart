import 'package:chas/src/view_models/view_model.dart';
import 'package:chas/src/views/home/widgets/tea_box_category_widget.dart';
import 'package:chas/src/views/home/widgets/tea_box_widget.dart';
import 'package:chas/src/views/home/widgets/tea_userbar_widget.dart';
import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import 'widgets/tea_search_bar_widget.dart';

class HomeView extends StatelessWidget {
  final viewModel = ViewModel();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                itemCount: viewModel.teas.length,
                padding: const EdgeInsets.only(left: 12),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return TeaBoxCategoryWidget(
                    teaPhoto: viewModel.teas[index].teaImage,
                    teaTitle: viewModel.teas[index].teaTitle,
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
                  // Column(
                  //   children: List.generate(
                  //     3,
                  //     (index) => const TeaBoxWidget(),
                  //   ),
                  // )
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: 3,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (BuildContext context, int index) =>
                        TeaBoxWidget(
                      onTap: () => Navigator.pushNamed(context, Routes.home),
                    ),
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
