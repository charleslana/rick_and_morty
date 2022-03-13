import 'package:get/get.dart';
import 'package:rick_and_morty/src/models/character_model.dart';
import 'package:rick_and_morty/src/providers/character_provider.dart';

class CharacterController extends GetxController
    with StateMixin<CharacterModel> {
  CharacterController({required this.characterProvider});

  CharacterProvider characterProvider = CharacterProvider();

  @override
  void onInit() {
    fetchCharacters();
    super.onInit();
  }

  void fetchCharacters() {
    characterProvider.getCharacters().then((result) {
      change(result, status: RxStatus.success());
    }, onError: (dynamic err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
