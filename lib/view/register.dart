import 'package:app_using_getx/custome_widget.dart/button.dart';
import 'package:app_using_getx/repository/userDataModel.dart';
import 'package:app_using_getx/view/allUserView.dart';
import 'package:app_using_getx/view_model/all_user_data_services.dart';
import 'package:app_using_getx/view_model/controller/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterViewModel registerControler = Get.put(RegisterViewModel());
  AllUserDataServices dataControler = Get.put(AllUserDataServices());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text(
          "Register",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Enter Your Details here',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: registerControler.email.value,
                decoration: InputDecoration(
                    label: Text("Email"),
                    hintText: "Email",
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: registerControler.password.value,
                decoration: InputDecoration(
                    label: Text("Password"),
                    hintText: "Password",
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => Button(
                    title:
                        registerControler.loading.value ? "wait" : "Register",
                    ontap: () {
                      registerControler.validate();
                      print(registerControler.email.value.text);
                      print(registerControler.password.value.text);
                    },
                    loading: false),
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                  title: "get",
                  ontap: () {
                    // dataControler.getUserData();
                    Get.to(UserListScreen());
                  },
                  loading: false)
            ],
          ),
        ),
      ),
    );
  }
}
