import 'package:chas/src/routes/routes.dart';
import 'package:chas/src/utils/hex_colors.dart';
import 'package:flutter/material.dart';

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
          Image.asset('assets/images/drinking_tea.png'),
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
