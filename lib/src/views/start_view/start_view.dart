import 'package:chas/src/routes/routes.dart';
import 'package:chas/src/utils/hex_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../global/widgets/tea_button_widget.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 100),
          Lottie.asset(
            'lib/src/mock/drinking_tea.json',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 60,
            ),
            child: TeaButtonWidget(
              title: 'Conheça Chás',
              onTap: () => Navigator.pushNamed(
                context,
                Routes.home,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
