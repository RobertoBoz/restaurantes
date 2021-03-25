
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import 'package:restaurantes/App/Modules/Home/Home_Controller.dart';

import 'package:restaurantes/App/Modules/Home/WidgetsLocal/BottomList.dart';
import 'package:restaurantes/App/Modules/Home/WidgetsLocal/Carrusel.dart';
import 'package:restaurantes/App/Modules/Home/WidgetsLocal/Categorias.dart';

import 'package:restaurantes/App/Theme/App_Colors.dart';
import 'package:restaurantes/App/Theme/App_Theme.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
    builder: (_) => Scaffold(
        backgroundColor: AppColors.themeligthbackground,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(                        
            children: <Widget>[            
              SafeArea(
                child: Column(                
                  children: <Widget>[
                    const AppBar(),                  
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 30,bottom: 10),
                      alignment: Alignment.centerLeft,            
                      child: Text('Categorías',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    ),
                    Categoria(),    
                          
                    Carrusel(),                 
                  ],

                ),
              ),                                         
              DrageList(),
              Positioned(
                bottom: 0,
                child: InkWell(
                  
                  onTap: _.crearNuevo,
                  child: Container(                
                    height: 50,
                    width: MediaQuery.of(context).size.width,                  
                    decoration: BoxDecoration(
                      color: AppColors.themeligthbackground,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                    ),
                    child: Center(child: Text('Nueva reseña + ', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),
                  ),
                ),
              )                                                                                 
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('+'),
          onPressed: _.createNewMarc,
        ),
      
      )
    );
  }
}





class AppBar extends StatelessWidget {
  const AppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      
      // margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.10,bottom:MediaQuery.of(context).size.width * 0.10 ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Image.asset('assest/ApkLogo.png',height: MediaQuery.of(context).size.height *0.15,),
            ),
            Container(
              // alignment: Alignment.
              child: Text('AppRestaurante',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
            )
            
        ],
      ),        
       decoration: AppTheme.appBar
    );
  }
}
