import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter_project/screen/detail_page.dart';
import 'package:getx_flutter_project/screen/home_screen.dart';
import 'package:getx_flutter_project/screen/intro_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=>IntroScreen()),
        GetPage(name: '/detail', page: ()=>DetailPage())
      ],
    );
  }
}
