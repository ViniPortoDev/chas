import 'package:chas/src/utils/hex_colors.dart';
import 'package:flutter/material.dart';


class TeaButtonWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const TeaButtonWidget({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: HexColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        width: size.width,
        height: 50,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: HexColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
