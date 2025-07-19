import 'dart:convert';

import 'package:app_using_getx/model/all_user_data_model/all_user_model.dart';
import 'package:app_using_getx/repository/all_user_data_repository/all_user_data_repository.dart';
import 'package:app_using_getx/res/utils/utils.dart';
import 'package:get/get.dart';

class AllUserDataServices extends GetxController {
  RxBool loading = false.obs;
  AllUsers allUser = AllUsers();
  RxList list = [].obs;
  final userRepo = AllUserDataRepository();
  getUserData() {
    list.clear();
    loading.value = true;
    userRepo.getAllUserData().then(
      (value) {
        // print(value);
        List users = value.map((json) => AllUsers.fromJson(json)).toList();
        // list.addAll(users);
        // print(list);
        // users.forEach((user) {
        //   print("ID: ${user.id}");
        //   print("Email: ${user.email}");
        //   print("Password: ${user.password}");
        //   print("Name: ${user.name}");
        //   print("------------------------");
        // });
        loading.value = false;
        // print(jsonEncode(value));
        print(value[1]['email']);
        // var data = jsonDecode(value);
        list.addAll(value);
        // List val = value;
        // print(val[0]['email']);
        // print(val[0]['name']);
        // print(val[0]['passwod']);
      },
    ).onError(
      (error, stackTrace) {
        loading.value = false;
        print(error.toString());
        // throw Exception(error.toString());
        Utils.showToast(error.toString());
      },
    );
  }
}
