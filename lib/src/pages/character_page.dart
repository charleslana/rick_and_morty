import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/src/controllers/character_controller.dart';
import 'package:rick_and_morty/src/routes/app_route_generator.dart';
import 'package:rick_and_morty/src/widgets/card_info.dart';
import 'package:rick_and_morty/src/widgets/welcome_info.dart';

class CharacterPage extends GetView<CharacterController> {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WelcomeInfo(
          menuText: 'character',
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                children: [
                  controller.obx(
                    (state) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: state?.results.length,
                        itemBuilder: (context, index) {
                          final character = state?.results[index];

                          return GestureDetector(
                            onTap: () => Get.toNamed<dynamic>(
                              AppRoutes.characterDetails,
                              arguments: character?.id,
                            ),
                            child: CardInfo(
                              image: character?.image as String,
                              name: character?.name as String,
                            ),
                          );
                        }),
                    onEmpty: const Text('Empty'),
                    onError: (error) => Text('Error: $error'),
                    onLoading: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
