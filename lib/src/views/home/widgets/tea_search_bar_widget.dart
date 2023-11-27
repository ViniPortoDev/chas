import 'package:flutter/material.dart';

import '../../../utils/hex_colors.dart';

class TeaSearchBarWidget extends StatelessWidget {
  const TeaSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: const BoxDecoration(
        color: HexColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            spreadRadius: -2,
          ),
        ],
      ),
      child: TextFormField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search_rounded,
              color: Color(0xff9a9481),
            ),
            hintText: 'Procure o seu chá predileto...',
            hintStyle: TextStyle(
              color: Color(0xff9a9481),
            )),
      ),
    );
  }
}
