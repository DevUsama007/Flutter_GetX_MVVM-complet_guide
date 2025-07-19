import 'package:flutter/material.dart';

class ModelBottomSheet {
  showModelBS(BuildContext context,Widget sheet) {
    showModalBottomSheet(
        builder: (context) {
          return sheet;
        },
        context: context);
  }
}
