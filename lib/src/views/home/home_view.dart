import 'package:chas/src/blocs/teas_bloc.dart';
import 'package:chas/src/blocs/teas_event.dart';
import 'package:chas/src/blocs/teas_states.dart';
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
  late final TeasBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = TeasBloc();
    bloc.inputTeas.add(LoadTeasEvent());
  }

  @override
  void dispose() {
    bloc.inputTeas.close();
    super.dispose();
  }

  final controller = TeasController(repository: TeasLocalRepository());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffececdc),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 12,
                  right: 12,
                ),
                child: Column(
                  children: [
                    const TeaUserbarWidget(
                      userName: 'Vinicius',
                    ),
                    const SizedBox(height: 20),
                    TeaSearchBarWidget(
                      onChanged: (value) {
                        controller.getTeasTypeThat(value);
                      },
                    ),
                    const SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Categorias',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          style: const ButtonStyle(
                            padding:
                                MaterialStatePropertyAll<EdgeInsetsGeometry?>(
                                    EdgeInsets.zero),
                          ),
                          onPressed: () =>
                              Navigator.pushNamed(context, Routes.categories),
                          child: const Text(
                            'Ver tudo',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  itemCount: controller.teaCategories.length,
                  padding: const EdgeInsets.only(left: 12),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(width: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return TeaBoxCategoryWidget(
                      teaTitle: controller.teaCategories[index].title,
                      teaPhoto: controller.teaCategories[index].imageUrl,
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.filteredTeas),
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
                    StreamBuilder<TeasStates>(
                        stream: bloc.stream,
                        builder: (context, snapshot) {
                          final teaList = snapshot.data?.teaList ?? [];
                          return ListView.separated(
                            shrinkWrap: true,
                            itemCount: teaList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 12),
                            itemBuilder: (BuildContext context, int index) =>
                                TeaBoxWidget(
                              title: teaList[index].title,
                              description: teaList[index].description,
                              teaImage: teaList[index].imagemUrl,
                              onTap: () => Navigator.pushNamed(
                                context,
                                Routes.infoTea,
                                arguments: teaList[index],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
