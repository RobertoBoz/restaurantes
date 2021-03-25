import 'package:get/get.dart';
import 'package:restaurantes/App/Modules/Splash/Splash_Controller.dart';



class SplashBinding extends Bindings{
  
  @override
  void dependencies() {        
    Get.lazyPut(() => SplashController());
  }

}