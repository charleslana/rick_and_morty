import 'package:get/get.dart';
import 'package:rick_and_morty/src/controllers/character_controller.dart';
import 'package:rick_and_morty/src/providers/character_provider.dart';

class CharacterBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<CharacterProvider>(CharacterProvider.new)
      ..lazyPut<CharacterController>(
          () => CharacterController(characterProvider: Get.find()));
  }
}
