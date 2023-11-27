import 'package:chas/src/utils/hex_colors.dart';
import 'package:flutter/material.dart';

class TeaUserbarWidget extends StatelessWidget {
  final String userName;
  const TeaUserbarWidget({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: HexColors.primary),
                image: const DecorationImage(
                  image: AssetImage('assets/images/user.jpg'),
                ),
              ),
            ),
            const SizedBox(width: 8),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Olá ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: HexColors.black,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  TextSpan(
                    text: userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: HexColors.primary,
                      fontFamily: 'Nunito',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            color: HexColors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: -5,
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_rounded,
              size: 24,
            ),
          ),
        )
      ],
    );
  }
}
