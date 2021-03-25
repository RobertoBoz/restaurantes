import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:restaurantes/App/Theme/App_Colors.dart';
import 'package:restaurantes/App/Theme/App_Theme.dart';
import 'package:restaurantes/App/Modules/Home/Home_Controller.dart';

class ContenidoNewReview extends StatelessWidget {
  const ContenidoNewReview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'drop',
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
                    child: Text("Nuevo Review de ${_.rest[_.currentPage].name}" ,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                    
                  ), 
                  InputTextCorreo(placeholder: 'Correo',) ,
                  SizedBox(height: 10),
                  InputTextComments(placeholder: 'Comentario',),
                  SizedBox(height: 10),                                                    
                  DropdownButton(
                    value: _.optselectDropdown,
                    items: _.listItemDrop,
                    onChanged: (opt) => _.onChangeItemDrop(opt),

                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: _.submitReview,
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


class InputTextCorreo extends StatelessWidget {
  
  final String placeholder;

  InputTextCorreo({@required this.placeholder, });

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
              validator: _.validatEmail,
              onSaved: (value) => _.email= value,
            ),
          ),
        ],
      ),
    );
  }
}


class InputTextComments extends StatelessWidget {
  
  final String placeholder;    
  InputTextComments({@required this.placeholder, });

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
              style:TextStyle(color: Colors.white,fontFamily: 'sans', fontSize:10 ) ,     
              decoration: InputDecoration(              
                hintStyle: TextStyle(color: Colors.white,fontFamily: 'sans' ),
                hintText: placeholder,        
                fillColor: AppColors.inputColor,
                focusColor:  AppColors.inputColor,
                hoverColor: AppColors.inputColor,
                focusedBorder: AppTheme.undelinecupertinoborderEnable,
                enabledBorder: AppTheme.undelinecupertinoborderDisable,
                errorBorder: AppTheme.undelinecupertinoborderror
                    
              ),
              validator: _.validateLong,
              onSaved: (value) => _.coment= value,
            ),
          ),
        ],
      ),
    );
  }
}



