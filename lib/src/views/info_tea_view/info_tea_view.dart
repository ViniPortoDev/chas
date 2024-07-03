import 'package:chas/src/models/tea_model.dart';
import 'package:chas/src/repositories/teas_local_repository.dart';
import 'package:chas/src/routes/routes.dart';
import 'package:chas/src/utils/hex_colors.dart';
import 'package:chas/src/controller/teas_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoTeaView extends StatelessWidget {
  const InfoTeaView({super.key});

  @override
  Widget build(BuildContext context) {
    final TeaModel tea = ModalRoute.of(context)?.settings.arguments as TeaModel;

    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColors.primary,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        tea.imagemUrl,
                      ),
                    ),
                  ),
                  height: 225,
                  width: size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: HexColors.white,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  tea.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: HexColors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    tea.type.join(', '),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: HexColors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: SingleChildScrollView(
                      child: Text(
                        tea.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: HexColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, Routes.prepareTea,
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
            )
          ],
        ),
      ),
    );
  }
}
