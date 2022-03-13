import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/src/utils/theme_utils.dart';

class WelcomeInfo extends StatelessWidget {
  const WelcomeInfo({
    Key? key,
    required this.menuText,
  }) : super(key: key);

  final String menuText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: Get.width,
      height: Get.height * 0.20,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        color: ThemeUtils.deepGreen,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Welcome to Api Rick and Morty',
                style: TextStyle(
                  color: ThemeUtils.blue,
                  fontSize: 20,
                  fontFamily: 'Schwifty',
                ),
              ),
            ),
          ),
          const Flexible(
            child: SizedBox(
              height: 20,
            ),
          ),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Choose your $menuText',
                style: const TextStyle(
                  color: ThemeUtils.blue,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
