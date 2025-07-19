import 'package:app_using_getx/res/colors/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static showToast(String message) {
    Get.snackbar(
        colorText: AppColors.white,
        backgroundColor: AppColors.black,
        "Notification",
        message);
  }
}
