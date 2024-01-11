import 'dart:math';

import 'package:chas/src/models/tea_model.dart';
import 'package:chas/src/repositories/teas_local_repository.dart';
import 'package:chas/src/utils/hex_colors.dart';
import 'package:chas/src/controller/teas_controller.dart';
import 'package:flutter/material.dart';

class PrepareTeaView extends StatelessWidget {
  const PrepareTeaView({super.key});

  @override
  Widget build(BuildContext context) {
    final TeaModel tea = ModalRoute.of(context)?.settings.arguments as TeaModel;

    final size = MediaQuery.of(context).size;

    Color _randomColor() {
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
              forceMaterialTransparency: true,
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 26,
                  color: Colors.white,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              tea.title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: HexColors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Icon(
                              Icons.coffee,
                              color: HexColors.white,
                            ),
                            Text(
                              "  ${tea.preparation[0]['label']}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: HexColors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "  ${tea.preparation[0]['value']}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: HexColors.white,
                          ),
                        ),
                        const SizedBox(height: 26),
                        Row(
                          children: [
                            const Icon(
                              Icons.eco,
                              color: HexColors.white,
                            ),
                            Text(
                              "  ${tea.preparation[1]['label']}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: HexColors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            2,
                            (index) => Text(
                              '${index + 1}.  ${tea.preparation[1]['value'][index]}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: HexColors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 26),
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time_rounded,
                              color: HexColors.white,
                            ),
                            Text(
                              "  ${tea.preparation[2]['label']}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: HexColors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "  ${tea.preparation[2]['value']}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: HexColors.white,
                          ),
                        ),
                        const SizedBox(height: 26),
                        Row(
                          children: [
                            const Icon(
                              Icons.diversity_2_outlined,
                              color: HexColors.white,
                            ),
                            Text(
                              "  ${tea.preparation[3]['label']}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: HexColors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "  ${tea.preparation[3]['value']}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: HexColors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
