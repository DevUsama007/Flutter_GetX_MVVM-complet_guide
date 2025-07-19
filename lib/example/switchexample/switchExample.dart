import 'package:app_using_getx/example/switchexample/switchFunction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Switchexample extends StatefulWidget {
  const Switchexample({super.key});

  @override
  State<Switchexample> createState() => _SwitchexampleState();
}

class _SwitchexampleState extends State<Switchexample> {
  SwitchExampl controler = Get.put(SwitchExampl());
  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Obx(
          () => Text(
            "Switch Example",
            style: TextStyle(
                color: controler.switchVal.value ? Colors.white : Colors.black),
          ),
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            ListTile(
              leading: Text("Click to on the button"),
              trailing: Obx(
                () => Switch(
                  activeTrackColor: Colors.amberAccent,
                  activeColor: Colors.white,
                  value: controler.switchVal.value,
                  onChanged: (value) {
                    controler.changeSwitch(value);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
