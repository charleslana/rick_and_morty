import 'package:get/get.dart';
import 'package:rick_and_morty/src/controllers/app_navigation_bar_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppNavigationBarController>(AppNavigationBarController.new);
  }
}
