import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/src/controllers/app_navigation_bar_controller.dart';
import 'package:rick_and_morty/src/utils/theme_utils.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    Key? key,
    required this.widgets,
    required this.bottomNavigationBarItem,
  }) : super(key: key);

  final List<Widget> widgets;
  final List<BottomNavigationBarItem> bottomNavigationBarItem;

  @override
  Widget build(BuildContext context) {
    final AppNavigationBarController appNavigationBarController = Get.find();

    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: ThemeUtils.yellow,
          appBar: AppBar(
            backgroundColor: ThemeUtils.green,
            elevation: 0,
            title: const Text('Search'),
            centerTitle: true,
            actions: const [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body:
              widgets.elementAt(appNavigationBarController.currentIndex.value),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ThemeUtils.green,
            selectedItemColor: ThemeUtils.deepGreen,
            currentIndex: appNavigationBarController.currentIndex.value,
            onTap: appNavigationBarController.changeView,
            items: bottomNavigationBarItem,
          ),
        );
      }),
    );
  }
}
