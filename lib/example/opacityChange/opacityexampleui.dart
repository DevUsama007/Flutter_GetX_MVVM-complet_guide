import 'package:app_using_getx/example/opacityChange/opacityChnage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Opacityexampleui extends StatefulWidget {
  const Opacityexampleui({super.key});

  @override
  State<Opacityexampleui> createState() => _OpacityexampleuiState();
}

class _OpacityexampleuiState extends State<Opacityexampleui> {
  opacityclas controler = Get.put(opacityclas());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Obx(
          () => Opacity(
            opacity: controler.visibility.toDouble(),
            child: Text("Opacity Example"),
          ),
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        
            Obx(
              () => controler.visibility.toDouble() >= 0.8
                  ? Text("greater then 0.8 ${controler.visibility.toDouble()}")
                  : Text("less then to 0.8 ${controler.visibility.toDouble()}"),
            ),
            Obx(
              () => Opacity(
                opacity: controler.visibility.toDouble(),
                child: Container(
                  width: 120,
                  height: 120,
                  color: Colors.amber,
                  child: Center(child: Text("Getx")),
                ),
              ),
            ),
            Obx(
              () => Slider(
                value: controler.visibility.toDouble(),
                onChanged: (value) {
                  controler.changeopacity(value);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
