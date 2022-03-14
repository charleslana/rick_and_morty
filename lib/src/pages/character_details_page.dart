import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/src/controllers/character_details_controller.dart';
import 'package:rick_and_morty/src/utils/theme_utils.dart';
import 'package:rick_and_morty/src/widgets/card_details.dart';
import 'package:rick_and_morty/src/widgets/custom_app_bar.dart';

class CharacterDetailsPage extends GetView<CharacterDetailsController> {
  const CharacterDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: controller.obx(
        (state) => Scaffold(
          backgroundColor: ThemeUtils.yellow,
          appBar:
              CustomAppBar(title: '${state?.name as String} (#${state?.id})'),
          body: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state?.image as String),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Specie: ${state?.species as String}',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Wrap(
                          children: [
                            CardDetails(
                              title: 'Status',
                              description: state?.status as String,
                            ),
                            CardDetails(
                              title: 'Type',
                              description: state?.type.isNotEmpty == true
                                  ? state?.type as String
                                  : 'unknown',
                            ),
                            CardDetails(
                              title: 'Gender',
                              description: state?.gender as String,
                            ),
                            CardDetails(
                              title: 'Origin/View',
                              description: state?.origin.name as String,
                              isTitleUnderline: true,
                            ),
                            CardDetails(
                              title: 'Location/View',
                              description: state?.location.name as String,
                              isTitleUnderline: true,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 30,
                          child: Text('Espisodes'),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                          ),
                          itemCount: state?.episode.length,
                          itemBuilder: (BuildContext context, int index) {
                            final episode = state?.episode[index].split('/');

                            return Card(
                              child: Center(
                                child: Text(
                                  episode?.last as String,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        onEmpty: const Text('Empty'),
        onError: (error) => Text('Error: $error'),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
