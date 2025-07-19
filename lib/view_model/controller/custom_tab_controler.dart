import 'package:get/get.dart';

class CustomTabControler extends GetxController {
  // Current index of the selected tab
  RxInt currentIndex = 0.obs;

  // Function to change the selected tab
  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
