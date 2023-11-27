import 'package:flutter/material.dart';

class TeaBoxCategoryWidget extends StatelessWidget {
  final String teaPhoto;
  final String teaTitle;

  const TeaBoxCategoryWidget({
    super.key,
    required this.teaPhoto,
    required this.teaTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 80,
          width: 80,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            teaPhoto,
            fit: BoxFit.cover,
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
