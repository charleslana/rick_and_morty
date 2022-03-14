import 'package:get/get.dart';
import 'package:rick_and_morty/src/constants/constants.dart';
import 'package:rick_and_morty/src/models/character_details_model.dart';

class CharacterDetailsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient
      ..baseUrl = baseUrl
      ..defaultDecoder = CharacterDetailsModel.decoderFromJson;
    super.onInit();
  }

  Future<CharacterDetailsModel> getCharacter(int id) async {
    final response = await get<dynamic>('/character/$id');
    if (response.status.hasError) {
      return Future.error(response.status);
    }
    return response.body;
  }
}
