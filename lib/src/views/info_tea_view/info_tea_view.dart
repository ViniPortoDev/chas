import 'dart:math';

import 'package:chas/src/models/tea_model.dart';
import 'package:chas/src/repositories/teas_local_repository.dart';
import 'package:chas/src/routes/routes.dart';
import 'package:chas/src/utils/hex_colors.dart';
import 'package:chas/src/controller/teas_controller.dart';
import 'package:flutter/material.dart';

class InfoTeaView extends StatelessWidget {
  const InfoTeaView({super.key});

  @override
  Widget build(BuildContext context) {
    final TeaModel tea = ModalRoute.of(context)?.settings.arguments as TeaModel;

    

    Color randomColor() {
      Random random = Random();
      return Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1.0,
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColors.primary,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 225,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  tea.imagemUrl,
                  fit: BoxFit.cover,
                ),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 26,
                  color: HexColors.white,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pop();
                },
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          tea.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: HexColors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                            tea.categories.length,
                            (index) => IntrinsicWidth(
                              child: Container(
                                height: 25,
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                    color: randomColor(),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Center(
                                  child: Text(
                                    tea.categories[index],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: HexColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Icon(
                              Icons.emoji_food_beverage,
                              color: HexColors.white,
                            ),
                            Text(
                              "  ${tea.description[0]['label']}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: HexColors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "  ${tea.description[0]['value']}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: HexColors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Icon(
                              Icons.spa,
                              color: HexColors.white,
                            ),
                            Text(
                              "  ${tea.description[1]['label']}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: HexColors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "  ${tea.description[1]['value']}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: HexColors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Icon(
                              Icons.local_florist_sharp,
                              color: HexColors.white,
                            ),
                            Text(
                              "  ${tea.description[2]['label']}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: HexColors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "  ${tea.description[2]['value']}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: HexColors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Icon(
                              Icons.travel_explore_rounded,
                              color: HexColors.white,
                            ),
                            Text(
                              "  ${tea.description[3]['label']}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: HexColors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "  ${tea.description[3]['value']}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: HexColors.white,
                          ),
                        ),
                        const SizedBox(height: 40),
                        InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, Routes.prepareTea,
                              arguments: tea),
                          child: Container(
                            width: 230,
                            height: 40,
                            decoration: BoxDecoration(
                              color: HexColors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Center(
                              child: Text(
                                'Como Preparar',
                                style: TextStyle(
                                  color: HexColors.primary,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 35),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 225,
            //   width: size.width,
            //   child: Image.network(
            //     tea.imagemUrl,
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
