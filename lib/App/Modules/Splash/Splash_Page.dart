import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import 'package:get/get.dart';

import 'package:restaurantes/App/Modules/Splash/Splash_Controller.dart';
import 'package:restaurantes/App/Theme/App_Colors.dart';



class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        backgroundColor:  AppColors.themeligthprimarycolor,
        body: Center(
          child: ZoomOut(
            from: 30,
            duration: Duration(seconds: 1),
            child: Image.asset('assest/ApkLogo.png', width: 50, height: 50, color: Colors.white,)
          ),
        )
      ),
    );
  }
}