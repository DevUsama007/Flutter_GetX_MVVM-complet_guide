import 'package:app_using_getx/homescreen.dart';
import 'package:app_using_getx/example/listGetxExample.dart/getListui.dart';
import 'package:app_using_getx/example/opacityChange/opacityexampleui.dart';
import 'package:app_using_getx/res/routes/routes.dart';
import 'package:app_using_getx/example/switchexample/switchExample.dart';
import 'package:app_using_getx/res/language/translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Language(), // your translations
      locale:
          Locale('en', 'US'), // translations will be displayed in that locale
      fallbackLocale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      getPages: AppRoutes.appRoutes(),
      home: const Homescreen(),
    );
  }
}