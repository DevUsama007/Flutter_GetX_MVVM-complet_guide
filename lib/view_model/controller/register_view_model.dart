import 'package:app_using_getx/repository/register_repository/register_repository.dart';
import 'package:app_using_getx/repository/userDataModel.dart';
import 'package:app_using_getx/res/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class RegisterViewModel extends RxController {
  final _api = RegisterRepository();
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;
  final name = TextEditingController().obs;
  RxBool loading = false.obs;

  validate() {
    loading.value = true;
    if (email.value.text.isEmpty) {
      Get.snackbar("Empty", "Please enter email");
      loading.value = false;
    } else if (password.value.text.isEmpty) {
      Get.snackbar("Empty", "Please enter password");
      loading.value = false;
    } else {
      Map data = {
        'user_email': email.value.text,
        'user_password': password.value.text,
        'name': 'Usama Basharat'
      };

      _api.registerApi(data).then(
        (value) {
          UserDetail user = UserDetail.fromJson(value);

          print("-----------------------------------------${user.success}");
          loading.value = false;
          // print("-------------+-----${value["Success"]}");
          print(value);
          if (value["Success"] == "already") {
            Utils.showToast("already have a account");
          } else {
            Utils.showToast("Account registere");
          }
          // Utils.showToast(value.toString());
        },
      ).onError(
        (error, stackTrace) {
          loading.value = false;
          Utils.showToast("${error}");
        },
      );
    }
  }
}
