import 'package:flutter/material.dart';

class TeaBoxCategoryWidget extends StatelessWidget {
  final String teaTitle;
  final String teaPhoto;
  final double? size;
  final Function()? onTap;

  const TeaBoxCategoryWidget({
    super.key,
    required this.teaTitle,
    required this.teaPhoto,
    this.size,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            height: size ?? 80,
            width: size ?? 80,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                isAntiAlias: true,
                fit: BoxFit.cover,
                image: NetworkImage(
                  teaPhoto,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          teaTitle,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
