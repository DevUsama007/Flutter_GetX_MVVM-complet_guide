import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screenone extends StatefulWidget {
  const Screenone({super.key});

  @override
  State<Screenone> createState() => _ScreenoneState();
}

class _ScreenoneState extends State<Screenone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen one'),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Hero(
              tag: "one",
              child: Card(
                  child: Container(
                      width: Get.width,
                      height: 40,
                      child: Center(child: Text("Go Back to Previous")))),
            ),
          ),
          Text('Name'.tr),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    var locale = Locale('eu', 'US');
                    Get.updateLocale(locale);
                  },
                  child: Text("changeBTNE".tr)),
              SizedBox(
                width: 50,
              ),
              TextButton(
                  onPressed: () {
                    var locale = Locale('ur', 'PK');
                    Get.updateLocale(locale);
                  },
                  child: Text('changeBTNU'.tr))
            ],
          )
        ],
      ),
    );
  }
}
