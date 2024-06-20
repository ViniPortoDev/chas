import 'package:chas/src/models/tea_model.dart';
import 'package:chas/src/repositories/teas_local_repository.dart';
import 'package:chas/src/utils/hex_colors.dart';
import 'package:chas/src/views/home/widgets/tea_box_category_widget.dart';
import 'package:chas/src/views/home/widgets/tea_box_widget.dart';
import 'package:chas/src/views/home/widgets/tea_search_bar_widget.dart';
import 'package:chas/src/views/home/widgets/tea_userbar_widget.dart';
import 'package:flutter/material.dart';

import '../../controller/teas_controller.dart';

class FilteredTeasView extends StatelessWidget {
  FilteredTeasView({super.key});
  final controller = TeasController(repository: TeasLocalRepository());

  @override
  Widget build(BuildContext context) {
    final List<TeaModel> teaListFiltered =
        ModalRoute.of(context)?.settings.arguments as List<TeaModel>;
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TeaSearchBarWidget(),
                  const SizedBox(height: 40),
                  Column(
                    children: List.generate(
                      teaListFiltered.length,
                      (index) => TeaBoxWidget(
                          title: teaListFiltered[index].title,
                          description: teaListFiltered[index].description,
                          teaImage: teaListFiltered[index].imagemUrl),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
