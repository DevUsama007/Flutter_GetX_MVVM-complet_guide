import 'package:get/get.dart';

class Counter extends GetxController {
  RxInt count = 1.obs;
  countfunc() {
    count.value++;
  }
}
