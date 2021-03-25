
import 'package:get/get.dart';

import 'package:restaurantes/App/Routes/App_Routes.dart';


class SplashController extends GetxController{

 

  

  SplashController(); 

  @override
  void onInit(){
    super.onInit();  
    _init();
  }


  _init() async {

     
    Future.delayed(
      Duration(milliseconds: 700), (){          
         
            Get.offNamed(AppRoutes.HOME);
      }
    );          
  }
  
}