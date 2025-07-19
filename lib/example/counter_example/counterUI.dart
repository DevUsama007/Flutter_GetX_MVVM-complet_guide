import 'package:app_using_getx/example/counter_example/counter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Counterui extends StatefulWidget {
  const Counterui({super.key});

  @override
  State<Counterui> createState() => _CounteruiState();
}

class _CounteruiState extends State<Counterui> {
  Counter controler = Get.put(Counter());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text("Counter Example"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        onPressed: () {
          controler.countfunc();
          print(controler.count.toString());
        },
        child: Icon(Icons.yard),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Center(child: Obx(
          () {
            return Text(
              controler.count.toString(),
              style: TextStyle(fontSize: 40),
            );
          },
        )),
      ),
    );
  }
}
