import 'package:app_using_getx/custome_widget.dart/button.dart';
import 'package:app_using_getx/res/routes/routes.dart';
import 'package:app_using_getx/view_model/controller/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginController = Get.put(LoginViewModel());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Login"),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Enter your data to login",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              controller: loginController.emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "email",
                  label: Text("Email")),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              controller: loginController.passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "password",
                  label: Text("Password")),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => Button(
                  title:
                      loginController.loading.value ? "wait please" : "Login",
                  ontap: () {
                    loginController.validation();
                  },
                  loading: loginController.loading.value),
            )
          ],
        ),
      ),
    );
  }
}
