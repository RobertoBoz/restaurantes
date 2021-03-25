import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:restaurantes/App/Modules/Home/WidgetsLocal/ContenidoAlertReview.dart';
import 'package:restaurantes/App/Modules/Home/WidgetsLocal/ContentAlertNewRestaurant.dart';

import 'package:restaurantes/App/Theme/App_Colors.dart';
import 'package:restaurantes/App/Theme/App_Theme.dart';

class Alerts {

  static void alertCreateNewReview(){
    Get.dialog(      
      AlertDialog(
        scrollable: true,
        backgroundColor: AppColors.themeligthprimarycolor,
        shape: RoundedRectangleBorder(borderRadius: AppTheme.alertradius),        
        content: ContenidoNewReview(),                         
      ),
      // barrierDismissible: false,   
    );
  }

  static void alertCreateNewRestaurante(){
    Get.dialog(      
      AlertDialog(
        scrollable: true,
        backgroundColor: AppColors.themeligthprimarycolor,
        shape: RoundedRectangleBorder(borderRadius: AppTheme.alertradius),        
        content: ContentAlertRestaurant(),                         
      ),
      // barrierDismissible: false,   
    );
  }
}


