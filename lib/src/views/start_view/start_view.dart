import 'package:chas/src/routes/routes.dart';
import 'package:chas/src/utils/hex_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../global/widgets/tea_button_widget.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColors.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: size.height * 0.6,
              color: Colors.red,
              child: Lottie.asset(
                'lib/src/mock/drinking_tea.json',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: TeaButtonWidget(
                title: 'Conheça Chás',
                onTap: () => Navigator.pushNamed(
                  context,
                  Routes.home,
                ),
              ),
            ),
            const SizedBox(height: 0),
          ],
        ),
      ),
    );
  }
}
