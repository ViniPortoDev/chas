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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 26,
              color: HexColors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                const Row(
                  children: [
                    Icon(
                      Icons.coffee,
                      color: HexColors.white,
                    ),
                    Text(
                      ' Preparo:',
                      style: TextStyle(
                          fontSize: 14,
                          color: HexColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  "  ${tea.description}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: HexColors.white,
                  ),
                ),
                const SizedBox(height: 26),
                const Row(
                  children: [
                    Icon(
                      Icons.eco,
                      color: HexColors.white,
                    ),
                    Text(
                      ' Ingredientes:',
                      style: TextStyle(
                          fontSize: 14,
                          color: HexColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  children: List.generate(
                    2,
                    (index) => Text(
                      '${index + 1}. Folhas de Erva-Cidreira',
                      style: const TextStyle(
                        fontSize: 14,
                        color: HexColors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                const Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: HexColors.white,
                    ),
                    Text(
                      ' Tempo de preparo:',
                      style: TextStyle(
                          fontSize: 14,
                          color: HexColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  "tea.preparationTime",
                  style: const TextStyle(
                    fontSize: 14,
                    color: HexColors.white,
                  ),
                ),
                const SizedBox(height: 26),
                const Row(
                  children: [
                    Icon(
                      Icons.diversity_2_outlined,
                      color: HexColors.white,
                    ),
                    Text(
                      ' Categorias:',
                      style: TextStyle(
                          fontSize: 14,
                          color: HexColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                const SizedBox(height: 12),
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
                            color: _randomColor(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
