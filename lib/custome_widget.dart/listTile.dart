import 'package:app_using_getx/example/counter_example/counterUI.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ListTile extends StatefulWidget {
  final String title;
  final VoidCallback ontap;
  ListTile({super.key, required this.title, required this.ontap});

  @override
  State<ListTile> createState() => _ListTileState();
}

class _ListTileState extends State<ListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      // onTap: () {
      //   Get.to(() => Counterui());
      // },
      child: Card(
          child: Container(
              width: Get.width,
              height: 40,
              child: Center(child: Text(widget.title)))),
    );
  }
}

class TableShow extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  TableShow({Key? key, required this.title, required this.ontap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      // onTap: () {
      //   Get.to(() => Counterui());
      // },
      child: Card(
          child: Container(
              width: Get.width, height: 40, child: Center(child: Text(title)))),
    );
  }
  
  
}

class CustomElevatedButton extends StatelessWidget {
  final String text; // Button text
  final VoidCallback onPressed; // Button action callback
  final Color? backgroundColor; // Optional background color
  final Color? textColor; // Optional text color
  final double? borderRadius; // Optional border radius
  final double? width; // Optional button width
  final double? height; // Optional button height
  final double? fontSize; // Optional font size

  const CustomElevatedButton({
    Key? key,
    required this.text, // Required text
    required this.onPressed, // Required onPressed callback
    this.backgroundColor = Colors.blue, // Default background color
    this.textColor = Colors.white, // Default text color
    this.borderRadius = 8.0, // Default border radius
    this.width, // Optional width
    this.height = 50.0, // Default height
    this.fontSize = 16.0, // Default font size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!), // Border radius
          ),
        ),
        onPressed: onPressed, // Button action
        child: Text(
          text,
          style: TextStyle(
            color: textColor, // Text color
            fontSize: fontSize, // Font size
          ),
        ),
      ),
    );
  }
}
