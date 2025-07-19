import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomeContainer extends StatelessWidget {
  String title;
  VoidCallback ontap;
  Color clr;
  CustomeContainer(
      {Key? key, required this.clr, required this.title, required this.ontap})
      : super(key: key);
  @override
  Widget build(BuildContext) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: Get.width,
        height: 50,
        decoration:
            BoxDecoration(color: clr, borderRadius: BorderRadius.circular(20)),
        child: Center(child: Text(title)),
      ),
    );
  }
}
