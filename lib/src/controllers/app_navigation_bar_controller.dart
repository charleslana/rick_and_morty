import 'package:get/get.dart';

class AppNavigationBarController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeView(int index) {
    if (index != currentIndex.value) {
      currentIndex.value = index;
    }
  }
}
