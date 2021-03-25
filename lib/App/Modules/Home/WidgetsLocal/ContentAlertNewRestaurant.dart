
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:restaurantes/App/Modules/Home/Home_Controller.dart';
import 'package:restaurantes/App/Theme/App_Colors.dart';
import 'package:restaurantes/App/Theme/App_Theme.dart';

class ContentAlertRestaurant extends StatelessWidget {
  const ContentAlertRestaurant({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'dropmarc',
        builder: (_) =>  GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Form(
              key: _.formKey,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[

                  Container(
                    margin: EdgeInsets.only(top:20,bottom: 20),
                    child: Text("Nuevo Restaurante" ,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                    
                  ), 
                  InputTextName(placeholder: 'Nombre',) ,
                  SizedBox(height: 10),
                  InputTextDescription(placeholder: 'Description',),
                  SizedBox(height: 10),                                                    
                  DropdownButton(
                    value: _.optselectDropdownCat,
                    items: _.listItemDropCat,
                    onChanged: (opt) => _.onChangeItemDropCat(opt),

                  ),
                  SizedBox(height: 10),
                  (_.image == null )? IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                      size: 24.0,                      
                    ) , onPressed: _.selectImage
                  ): Icon(
                      Icons.camera_alt,
                      color: Colors.green,
                      size: 24.0,                      
                    ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: _.submitRestaurant,
                    child:  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,                        
                        ),
                        child: Center(child: Text('Crear')),
                      ),
                    ),
                  )
                ]
              ),
            ),
          ),
        )    
        
    );
  }
}


class InputTextName extends StatelessWidget {
  
  final String placeholder;

  InputTextName({@required this.placeholder, });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) =>Column(
        children: [                 
          Container(  
            height: 50,                       
            padding: EdgeInsets.zero,
            margin: EdgeInsets.symmetric( horizontal:7),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
                      
              cursorColor: AppColors.themeligthprimarycolor,     
              style:TextStyle(color: Colors.white,fontFamily: 'sans' ) ,   
              decoration: InputDecoration(

                hintStyle: TextStyle(color: Colors.white,fontFamily: 'sans' ),
                hintText: placeholder,        
                fillColor: Colors.white,
                focusColor:  Colors.white,
                hoverColor: Colors.white,
                focusedBorder: AppTheme.undelinecupertinoborderEnable,
                enabledBorder: AppTheme.undelinecupertinoborderDisable,
                errorBorder: AppTheme.undelinecupertinoborderror
                    
              ),
              validator: _.validateLong,
              onSaved: (value) => _.name= value,
            ),
          ),
        ],
      ),
    );
  }
}


class InputTextDescription extends StatelessWidget {
  
  final String placeholder;

  InputTextDescription({@required this.placeholder, });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) =>Column(
        children: [                 
          Container(  
            height: 50,                       
            padding: EdgeInsets.zero,
            margin: EdgeInsets.symmetric( horizontal:7),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
                      
              cursorColor: AppColors.themeligthprimarycolor,     
              style:TextStyle(color: Colors.white,fontFamily: 'sans',fontSize:10) ,   
              decoration: InputDecoration(

                hintStyle: TextStyle(color: Colors.white,fontFamily: 'sans' ),
                hintText: placeholder,        
                fillColor: Colors.white,
                focusColor:  Colors.white,
                hoverColor: Colors.white,
                focusedBorder: AppTheme.undelinecupertinoborderEnable,
                enabledBorder: AppTheme.undelinecupertinoborderDisable,
                errorBorder: AppTheme.undelinecupertinoborderror
                    
              ),
              validator: _.validateLong,
              onSaved: (value) => _.description= value,
            ),
          ),
        ],
      ),
    );
  }
}