import 'package:get/get.dart';
import 'package:rick_and_morty/src/models/character_details_model.dart';
import 'package:rick_and_morty/src/providers/character_details_provider.dart';

class CharacterDetailsController extends GetxController
    with StateMixin<CharacterDetailsModel> {
  CharacterDetailsController({
    required this.characterDetailsProvider,
    required this.characterId,
  });

  CharacterDetailsProvider characterDetailsProvider =
      CharacterDetailsProvider();
  int characterId;

  @override
  void onInit() {
    fetchCharacter();
    super.onInit();
  }

  void fetchCharacter() {
    characterDetailsProvider.getCharacter(characterId).then((result) {
      change(result, status: RxStatus.success());
    }, onError: (dynamic err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
