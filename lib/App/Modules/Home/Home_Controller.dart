


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'show Colors, DropdownMenuItem, FormState, GlobalKey, Text;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:restaurantes/App/Data/Models/Category.dart';
import 'package:restaurantes/App/Data/Models/Restaurant.dart';

import 'package:restaurantes/App/Data/Providers/Remote/CategoriRemoteService.dart';
import 'package:restaurantes/App/Data/Repositories/Remote/RepositoryService.dart';
import 'package:restaurantes/App/Modules/Home/WidgetsLocal/AlertCreate.dart';
import 'package:restaurantes/App/Modules/Home/WidgetsLocal/BottomList.dart';

class HomeController extends GetxController{

  ImagePicker _picker = ImagePicker();
  PickedFile image;
  
  GlobalKey<FormState> _formKey = GlobalKey(); 
  int currentPage = 0 ,currentFiltro,flag = 0;
  String name = '', urlimage= '', description = '', optselectDropdown, email = '', coment='',rating='',optselectDropdownCat; 
  List<Cat> cat = [];

  List<Restaurantes> rest = [] ,restfiltro = [] ;
  List<ItemReview> reviewsitem = [],reviewfiltro = [];
  List<DropdownMenuItem<String>> listItemDrop = [], listItemDropCat = [];
  
  
  
  RepositoryService _api = new RepositoryService();
 
  
  GlobalKey<FormState>get formKey => _formKey;
 

  @override
  void onInit(){    
    super.onInit(); 

    for(int i = 0 ;i <= 5; i++){
      listItemDrop.add(
        DropdownMenuItem(
          child: Text('$i'),
          value: i.toString(),            
        )
      );
    }  
    
    update(['drop,']);    
    
  
     categoriApi();
     restaurantGet();
     
    
  }

    
  @override
  void onClose() {
    super.onClose();
  }
 
  @override
  void onReady(){
    super.onReady();    
    update(['dropmarc']);    
  }

  

  void categoriApi()async {

    

    RepositoryServiceApi inst = new RepositoryServiceApi(_api);    
    List<Cat> response = await inst.categoriRepositori();
        
    cat = response;   
    cat.forEach(
      (element) { 
        print(element.name);
        listItemDropCat.add(  
          DropdownMenuItem(
            child: Text(element.name,),
            value: element.slug,            
          )
        );

     }
    );

    

    update(['cat',]);    
    
    

  }
  
  void restaurantGet() async {

     RepositoryServiceApi inst = new RepositoryServiceApi(_api);
     
     List<Restaurantes> response = await  inst.restaurantRepositori(); 
     rest = response;     

    update(['carusel']);
    loadReviws();

  }

  void loadReviws(){
    reviewsitem = [];
    rest[currentPage].reviews.forEach(
      (review) {
        reviewsitem.add(
          ItemReview(
            coment: review.comments,
            email: review.email,
            puntuacion: review.rating,
          )
        );        
      }
    );
    
    update(['review']);
  }

 

  void crearNuevo(){
    Alerts.alertCreateNewReview();
  }

  void createNewMarc(){
    Alerts.alertCreateNewRestaurante();

  }



  Future<void> submitRestaurant() async {
    _formKey.currentState.save();   
    RepositoryServiceApi inst = new RepositoryServiceApi(_api);
    inst.createNewRestaurant(name: name, detail: description, image: image, category: [optselectDropdown]);
    //  Get.back(); 
    //  Future.delayed(
    //   Duration(milliseconds: 500), (){          
    //     restaurantGet();            
    //   }
    // );  
    return null;
  }


  void submitReview() {
    _formKey.currentState.save();   
    RepositoryServiceApi inst = new RepositoryServiceApi(_api);    
    inst.createRepositoriNewReview(name: rest[currentPage].slug, email: email, raiting: optselectDropdown, coment: coment);             
     Get.back(); 
     Future.delayed(
      Duration(milliseconds: 500), (){          
        restaurantGet();            
      }
    );             
  }

  void selectImage() async {

     image  = await _picker.getImage(source:ImageSource.gallery);
     print(image.path);
     update(['dropmarc']);

  }

  




  // validations

  String validateLong(String text){
    if(text.trim().length > 0){
      return null;
    }
    return "No tiene nungun valor ";
  }

  String validatEmail(String text){

    if(GetUtils.isEmail(text)){
      return null;      
    }
    return 'Formato de correo invalido';

  }

  // onchange

  void onChangeItemDrop(String opt){
    optselectDropdown = opt;
    update(['drop']);

  }

  
  
  void onchangefiltro(int index){   
    
    if(flag == 0){
      flag = 1 ;            
      currentFiltro = index;              
      rest.forEach((element) {
          if(element.foodType[0] == cat[currentFiltro].slug){
            restfiltro.add(element);            
          }
        }
      );                       
      update(['cat','review']); 
      onpageChange(0);    
          
    } else{
      if(currentFiltro == index){        
        currentFiltro = null;
        flag = 0;           
        restfiltro = [];        
        update(['cat','review']); 
        onpageChange(0);              
      }    
    }     
  }

   void onpageChange(int page) {
    if(flag == 0){
      this.currentPage = page;            
      update(['carusel']);
      loadReviws();
    }else{
      this.currentPage = page;            
      reviewfiltro = [];
      update(['carusel']);

       restfiltro[currentPage].reviews.forEach(
        (review) { 
          reviewfiltro.add(
            ItemReview(
              coment: review.comments,
              email: review.email,
              puntuacion: review.rating,
            )
          ); 
        }
      );

    }
    
  }

  void onChangeItemDropCat(String opt){
    optselectDropdownCat = opt;
    update(['dropmarc']);

  }


  




}