import 'package:app_using_getx/repository/login_repository/login_repository.dart';
import 'package:app_using_getx/res/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel {
  final LoginRepo = LoginRepository();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool loading = false.obs;
  validation() {
    loading.value = true;
    if (emailController.value.text.isEmpty) {
      loading.value = false;
      Utils.showToast("Enter your email");
    } else if (passwordController.value.text.isEmpty) {
      loading.value = false;
      Utils.showToast("Enter your Password");
    } else {
      Map data = {
        'email': emailController.value.text,
        'password': passwordController.value.text
      };
      LoginRepo.loginApi(data).then(
        (value) {
          print(value);

          if (value.toString() == "[]") {
            print('not founds');

            loading.value = false;
          } else {
            print("user registered");
            Utils.showToast(value[0]['name'].toString());
            loading.value = false;
          }
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
