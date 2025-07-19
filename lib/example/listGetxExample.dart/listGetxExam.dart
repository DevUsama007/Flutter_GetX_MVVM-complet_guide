import 'package:get/get.dart';

class ListGet extends GetxController {
  RxList<String> items =
      ['Apple', 'Banana', 'Grapes', 'Mango', 'Watermalon'].obs;
  RxList<dynamic> favourititems = [].obs;
  addFavourite(String value) {
    print(favourititems);
    favourititems.add(value);
  }

  removeFavourite(String value) {
    favourititems.remove(value);
  }
}
