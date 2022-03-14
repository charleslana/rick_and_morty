import 'package:get/get.dart';
import 'package:rick_and_morty/src/constants/constants.dart';
import 'package:rick_and_morty/src/models/character_model.dart';

class CharacterProvider extends GetConnect {
  @override
  void onInit() {
    httpClient
      ..baseUrl = baseUrl
      ..defaultDecoder = CharacterModel.decoderFromJson;
    super.onInit();
  }

  Future<CharacterModel> getCharacters() async {
    final response = await get<dynamic>('/character');
    if (response.status.hasError) {
      return Future.error(response.status);
    }
    // return characterModelFromJson(response.bodyString as String);
    return response.body;
  }
}
