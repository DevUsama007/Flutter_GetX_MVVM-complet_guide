import 'package:app_using_getx/custome_widget.dart/button.dart';
import 'package:app_using_getx/custome_widget.dart/delete_bottom_sheet.dart';
import 'package:app_using_getx/custome_widget.dart/model_bottom_sheet.dart';
import 'package:app_using_getx/example/counter_example/counterUI.dart';
import 'package:app_using_getx/custome_widget.dart/cusome_container.dart';
import 'package:app_using_getx/custome_widget.dart/listTile.dart';
import 'package:app_using_getx/res/assests/app_fonts.dart';
import 'package:app_using_getx/res/assests/image_assets.dart';
import 'package:app_using_getx/res/routes/routes.dart';
import 'package:app_using_getx/res/routes/routes_name.dart';
import 'package:app_using_getx/res/utils/utils.dart';
import 'package:app_using_getx/example/screenOne.dart';
import 'package:app_using_getx/view/custom_tab_view.dart';
import 'package:app_using_getx/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List clr = [Colors.red, Colors.black, Colors.amber, Colors.green];
  List<VoidCallback> route = [
    () => Get.toNamed(RouteName.homescreen),
    () => Get.toNamed(RouteName.screenOne),
    () => Get.toNamed(RouteName.homescreen),
    () => Get.toNamed(RouteName.screenOne),
    () => Get.toNamed(RouteName.register),
  ];
  List title = [
    'Register',
    'Title 1',
    'Title 2',
    'Title 3',
    'Title 4',
  ];
  ModelBottomSheet controller = ModelBottomSheet();
  String name = "Usama";
  @override
  Widget build(BuildContext context) {
    print("fdkasjf");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shower_sharp),
        onPressed: () {
          controller.showModelBS(context, DeleteAccountSheet());
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text("GetX HomePage"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width * 0.2,
              height: Get.height * 0.2,
              child: Image(image: AssetImage(AppAssets.user)),
            ),
            SizedBox(
              height: 20,
            ),
            Button(
                title: "Trending Songs",
                ontap: () => Get.toNamed(RouteName.trendingsongs),
                loading: false),
            Container(
              height: 4,
            ),
            Button(
                title: "Add Trending Songs",
                ontap: () => Get.toNamed(RouteName.addtrendingsong),
                loading: false),
            Container(
              height: 4,
            ),
            Button(
                title: "Resources view",
                ontap: () => Get.toNamed(RouteName.resourcesView),
                loading: false),
            Container(
              height: 4,
            ),
            Button(
                title: "Tab Bar view",
                ontap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyCustomeTab(),
                    )),
                loading: false),
            SizedBox(
              height: 20,
            ),
            Button(
                title: "My Detail",
                ontap: () => Get.toNamed(RouteName.myDetailView),
                loading: false),
            SizedBox(
              height: 20,
            ),
            Button(
                title: "Register",
                ontap: () => Get.toNamed(RouteName.register),
                loading: false),
            SizedBox(
              height: 20,
            ),
            Button(
                title: "Login",
                ontap: () => Get.toNamed(RouteName.login),
                loading: false),

            // CustomeContainer(
            //   clr: Colors.red,
            //   title: "Usama Basharat",
            //   ontap: () => Get.snackbar("Title", "That is Title"),
            // ),
            // Column(
            //   children: List.generate(
            //     4,
            //     (index) {
            //       return CustomeContainer(
            //         clr: clr[index],
            //         title: title[index],
            //         ontap: route[index],
            //       );
            //     },
            //   ),
            // ),
            TableShow(
              title: "Go to Screen one",
              ontap: () => Get.toNamed(RouteName.screenOne),
            ),
            InkWell(
              onTap: () {
                Get.bottomSheet(Container(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.changeTheme(ThemeData.light());
                        },
                        child: Card(
                            child: Container(
                                width: Get.width,
                                height: 40,
                                child: Center(child: Text("Light Theme")))),
                      ),
                      InkWell(
                        onTap: () {
                          print("object");
                          Get.changeTheme(ThemeData.dark());
                        },
                        child: Card(
                            child: Container(
                                width: Get.width,
                                height: 40,
                                child: Center(child: Text("Dark Theme")))),
                      ),
                    ],
                  ),
                ));
              },
              child: Hero(
                tag: "one",
                child: Card(
                    child: Container(
                        width: Get.width,
                        height: 40,
                        child: Center(
                            child: Text(
                          "themeChanger".tr,
                          style: TextStyle(
                              fontFamily: AppFonts.protestGuerrillaRegular),
                        )))),
              ),
            ),
            InkWell(
              onTap: () {
                Utils.showToast("i am showing the toast message");
                // Get.to(() => Screenone());
                Get.toNamed(RouteName.screenOne);
              },
              child: Card(
                  child: Container(
                      width: Get.width,
                      height: 40,
                      child: Center(child: Text("GoTo Next Screen ")))),
            ),
            InkWell(
              onTap: () {
                Get.to(() => Counterui());
              },
              child: Card(
                  child: Container(
                      width: Get.width,
                      height: 40,
                      child: Center(child: Text("Counter Example ")))),
            ),
          ],
        ),
      ),
    );
  }
}
