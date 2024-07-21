import 'package:api_calling_get_x/view/HomeScreen/HomeScreen.dart';
import 'package:api_calling_get_x/view/LoginScreen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     home: LoginScreen(),
    );
  }
}
