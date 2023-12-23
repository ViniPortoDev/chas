import 'package:chas/src/repositories/teas_local_repository.dart';
import 'package:chas/src/utils/hex_colors.dart';
import 'package:chas/src/views/home/widgets/tea_box_category_widget.dart';
import 'package:chas/src/views/home/widgets/tea_search_bar_widget.dart';
import 'package:chas/src/views/home/widgets/tea_userbar_widget.dart';
import 'package:flutter/material.dart';

import '../../controller/teas_controller.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({super.key});
  final controller = TeasController(repository: TeasLocalRepository());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 26,
              color: HexColors.primary,
            ),
          ),
        ),
        backgroundColor: const Color(0xffececdc),
        body: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TeaSearchBarWidget(),
                    ),
                    const SizedBox(height: 40),
                    Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: 20,
                      spacing: 20,
                      children: List.generate(
                        controller.teaCategories.length,
                        (index) => TeaBoxCategoryWidget(
                          teaTitle: controller.teaCategories[index].title,
                          teaPhoto: controller.teaCategories[index].imageUrl,
                          size: 100,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
