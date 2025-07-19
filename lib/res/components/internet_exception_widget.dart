import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternetExceptionWidget extends StatefulWidget {
  const InternetExceptionWidget({super.key});

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(Icons.cloud),
          Text("internet Error"),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Retry'))
        ],
      ),
    );
  }
}
