import 'package:chas/src/utils/hex_colors.dart';
import 'package:flutter/material.dart';

class TeaBoxWidget extends StatelessWidget {
  final void Function()? onTap;
  const TeaBoxWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 110,
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: HexColors.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5,
                  offset: Offset(4, 4),
                  spreadRadius: 2,
                  color: Colors.grey,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 12),
                SizedBox(
                  height: 90,
                  width: size.width * 0.35,
                  child: const Text(
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    'Aenean lacinia eu mauris nonullam corper. Aenean lacinia eu mauris non ullamcorper. ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: HexColors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.eco_outlined,
                        color: HexColors.white,
                        size: 32,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
              ],
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: Container(
              height: 100,
              width: 130,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    offset: Offset(1, 10),
                    spreadRadius: -2,
                    color: Colors.grey,
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/cha_verde.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
