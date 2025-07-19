import 'package:flutter/material.dart';

class Textfieldwidget extends StatelessWidget {
  TextEditingController controller;
  String hint;
  String title;
  Textfieldwidget(
      {super.key,
      required this.controller,
      required this.hint,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          hintText: hint.toString(),
          alignLabelWithHint: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors
                  .amber, // Focused border color (e.g., your purple accent)
              width: 1.5, // Thicker border when selected
            ),
            borderRadius: BorderRadius.circular(5), // Match your design
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors
                  .amber, // Focused border color (e.g., your purple accent)
              width: 1.5, // Thicker border when selected
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          // Optional: Add the same borderRadius to the base `border` for consistency
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
