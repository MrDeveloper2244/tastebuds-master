import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tastebuds/resources/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     
      // theme: ThemeData(

      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   scaffoldBackgroundColor: Colors.white, // Set your global background color here

      //   useMaterial3: true,
      // ),
      theme: ThemeData(
    fontFamily: 'Pretendard', // 👈 Global font set here
            scaffoldBackgroundColor: Colors.white, // Set your global background color here

  ),
      debugShowCheckedModeBanner: false,
      
      getPages: AppRoutes.appRoutes(),  // 👈 Global routes set here
    );
  }
}
