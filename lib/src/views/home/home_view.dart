import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: 0.08,
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xff8BC34A),
                  ),
                ),
                const SizedBox(),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                // border: Border.all(),
                borderRadius: BorderRadius.circular(18),
              ),
              height: 200,
              child: SizedBox(
                child: Image.asset('assets/images/cha-verde-1.jpg'),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Chá Verde',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xff666666),
              ),
            ),
            const Text(
              'Medicinal',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff333333),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Usado para Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam semper ex turpis, at porta ex condimentum non. Nullam nec lacus eget justo iaculis venenatis sollicitudin ut nunc.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff333333),
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Container(
                width: 260,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFF8BC34A),
                      Color(0xFF33691E)
                    ], // Gradiente de cores
                  ),
                ),
                child: Center(
                  child: const Text(
                    'Como Preparar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
