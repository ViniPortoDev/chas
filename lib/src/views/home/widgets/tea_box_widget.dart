import 'package:chas/src/utils/hex_colors.dart';
import 'package:flutter/material.dart';

class TeaBoxWidget extends StatelessWidget {
  final String title;
  final String description;
  final String teaImage;

  ValueNotifier<bool> isFavorite;

  final void Function()? onTap;
  final void Function()? onFavPressed;

  TeaBoxWidget({
    super.key,
    required this.title,
    required this.description,
    required this.teaImage,
    this.onTap,
    this.onFavPressed,
    bool isFav = false,
  }) : isFavorite = ValueNotifier(isFav);

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 150),
                    SizedBox(
                      width: size.width - 150 - 90,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: HexColors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            "  $description",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: HexColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: isFavorite,
                        builder: (context, value, child) => IconButton(
                          onPressed: onFavPressed,
                          icon: Icon(
                            isFavorite.value ? Icons.eco : Icons.eco_outlined,
                            color:
                                isFavorite.value ? Colors.red : HexColors.white,
                            size: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
              child: Image.network(
                teaImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
