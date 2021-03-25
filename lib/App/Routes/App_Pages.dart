
import 'package:get/get.dart';


import 'App_Routes.dart';

import 'package:restaurantes/App/Modules/Home/Home_Bildings.dart';
import 'package:restaurantes/App/Modules/Home/Home_Page.dart';

import 'package:restaurantes/App/Modules/Splash/Splash_Bildings.dart';
import 'package:restaurantes/App/Modules/Splash/Splash_Page.dart';







class AppPages {

  static final List<GetPage> pages = [
  
    GetPage(       
       name: AppRoutes.HOME,
       page: () => HomePage(),
       binding: HomeBinding(),
    ),
    GetPage(       
       name: AppRoutes.SPLASH,
       page: () => SplashPage(),
       binding: SplashBinding(),
    ),
    

  ];




}