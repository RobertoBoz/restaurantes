import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:restaurantes/App/Modules/Splash/Splash_Bildings.dart';
import 'package:restaurantes/App/Modules/Splash/Splash_Page.dart';

import 'package:restaurantes/App/Routes/App_Pages.dart';
import 'package:restaurantes/App/Theme/App_Colors.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget { 
  
  @override
  Widget build(BuildContext context) {         
    return GetMaterialApp(      
      debugShowCheckedModeBanner: false,
      title: 'ExamenRestaurantes ',      
      theme: ThemeData(
        primaryColor: AppColors.themeligthprimarycolor
      ),
      home: SplashPage(),
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,      
    );
  }
}