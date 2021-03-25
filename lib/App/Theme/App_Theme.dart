

import 'package:flutter/material.dart' show BorderRadius, BorderSide, BoxDecoration, BoxShadow, Colors, Offset, OutlineInputBorder, Radius;
// import 'package:restaurantes/App/Theme/App_Colors.dart';

class AppTheme {

  static  BoxDecoration appBar =  BoxDecoration(
    color: Colors.white,         
    boxShadow:  <BoxShadow>[
        BoxShadow(
        color: Colors.black,
        blurRadius: 5.0, 
        spreadRadius: 0.0, 
        offset: Offset(
          0.0, 
          0.0, 
        ),
      )
    ],
    
  );

   static final BorderRadius alertradius = BorderRadius.all(Radius.circular(32.0));

   static final undelinecupertinoborderEnable =  OutlineInputBorder(
    borderRadius: BorderRadius.circular(50.0),
    borderSide: BorderSide(color: Colors.white)
  );

  static final undelinecupertinoborderDisable =  OutlineInputBorder(
    borderRadius: BorderRadius.circular(50.0),
    borderSide: BorderSide(color: Colors.white)
  );

  
  static final undelinecupertinoborderror =  OutlineInputBorder(
    borderRadius: BorderRadius.circular(50.0),
    borderSide: BorderSide(color: Colors.red)
  );
  
  
}
