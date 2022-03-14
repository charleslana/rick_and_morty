import 'package:get/get.dart';
import 'package:rick_and_morty/src/controllers/character_details_controller.dart';
import 'package:rick_and_morty/src/providers/character_details_provider.dart';

class CharacterDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<CharacterDetailsProvider>(CharacterDetailsProvider.new)
      ..lazyPut<CharacterDetailsController>(() => CharacterDetailsController(
            characterDetailsProvider: Get.find(),
            characterId: Get.arguments,
          ));
  }
}
