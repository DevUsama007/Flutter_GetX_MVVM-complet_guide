import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatefulWidget {
  String title;
  VoidCallback ontap;
  bool loading;
  Button(
      {super.key,
      required this.title,
      required this.ontap,
      required this.loading});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.loading ? null : widget.ontap,
      child: Container(
        width: Get.width * 0.8,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: widget.loading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
