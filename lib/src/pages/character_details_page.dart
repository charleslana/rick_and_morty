import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/src/controllers/character_details_controller.dart';

class CharacterDetailsPage extends GetView<CharacterDetailsController> {
  const CharacterDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: controller.obx(
          (state) => Center(
            child: Text(state?.name ?? ''),
          ),
          onEmpty: const Text('Empty'),
          onError: (error) => Text('Error: $error'),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
