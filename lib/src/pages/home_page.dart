import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/src/pages/character_page.dart';
import 'package:rick_and_morty/src/pages/episode_page.dart';
import 'package:rick_and_morty/src/pages/location_page.dart';
import 'package:rick_and_morty/src/utils/image_utils.dart';
import 'package:rick_and_morty/src/widgets/app_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppNavigationBar(
      widgets: const [
        CharacterPage(),
        LocationPage(),
        EpisodePage(),
      ],
      bottomNavigationBarItem: [
        BottomNavigationBarItem(
          icon: Image.asset(
            ImageUtils.characters,
            height: Get.width * 0.10,
          ),
          label: 'Characters',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            ImageUtils.locations,
            height: Get.width * 0.10,
          ),
          label: 'Locations',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            ImageUtils.episodes,
            height: Get.width * 0.10,
          ),
          label: 'Episodes',
        ),
      ],
    );
  }
}
