import 'package:chas/src/repositories/teas_repository.dart';
import 'package:chas/src/utils/hex_colors.dart';
import 'package:chas/src/view_models/teas_view_model.dart';
import 'package:flutter/material.dart';

class InfoTeaView extends StatelessWidget {
  const InfoTeaView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = TeasViewModel(repository: TeasRepository());

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: HexColors.primary,
      body: Column(
        children: [
          SizedBox(
            height: 225,
            width: size.width,
            child: Image.asset(
              'assets/images/cha_verde.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Chá Verde',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: HexColors.white,
            ),
          ),
          const Text(
            'Medicinal',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: HexColors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Usado para Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam semper ex turpis, at porta ex condimentum non. Nullam nec lacus eget justo iaculis venenatis sollicitudin ut nunc.',
              style: TextStyle(
                fontSize: 14,
                color: HexColors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () => viewModel.getTeaList(),
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
          )
        ],
      ),
    );
  }
}
