
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart' show required;

import 'package:http/http.dart' as http;
import 'package:restaurantes/App/Data/Models/Restaurant.dart';
import 'package:restaurantes/App/Data/Models/Reviews.dart';

import 'package:restaurantes/App/Utils/Constants.dart';
import 'package:restaurantes/App/Data/Models/Category.dart';


class RepositoryService {

 
  Future <List<Cat>> categoriService() async{

    final String ur = Constant.url;
    final String url = '$ur/api/food_types/';   

     final response = await http.get(
      url,            
    ).timeout(Duration(milliseconds: 20000)); 
    // print(response.body); 

    List decode = jsonDecode(response.body); 
    List<Cat> cat = [];

    decode.forEach(
      (category) {
        
        Cat a = Cat.fromJson(category);
        cat.add(a);

      }
    );    
    
    return cat;


  }

  Future <List<Restaurantes>> restaurantRepositoriGet() async {

    final String ur = Constant.url;
    final String url = '$ur/api/restaurants/';   

     final response = await http.get(
      url,            
    ).timeout(Duration(milliseconds: 20000)); 

    List decode = jsonDecode(response.body);   
    List<Restaurantes> rest = [];

    decode.forEach(
      (restaurant) {
        
        Restaurantes response = Restaurantes.fromJson(restaurant);       
        rest.add(response);

      }
    );  

    // List<Review> review = await reviwes(); 

    // review.forEach(      
    //   (rev) { 
    //     for(int i = 0; i < rest.length ; i++){

    //       for(int j = 0 ; j < rest[i].reviews.length; j++ ){

    //         if(rev.restaurant == rest[i].slug){

    //           if(rev.slug  == rest[i].reviews[j].slug){
    //             print('los id son iguales ');
                
    //             rest[i].reviews.add(rev);

    //           }
    //         }           
    //       }                                        
    //     }
    //   }
    // );

    return rest;

  }


  Future <List<Review>> reviwes() async {

    final String ur = Constant.url;
    final String url = '$ur/api/reviews/';   

     final response = await http.get(
      url,            
    ).timeout(Duration(milliseconds: 20000)); 

    List decode = jsonDecode(response.body);   
    List<Review> review = [];

    decode.forEach(
      (rev) {
        
        Review response = Review.fromJson(rev);       
      
        review.add(response);

      }
    );   

    return review;

  }


  Future<void> createNewRestaurantService({@required String name, @required String detail, @required PickedFile image,@required List<String> category  } ) async 
  {
    
    final String ur = Constant.url;
    final String url = '$ur/api/restaurants/';   


   
    final File file = File(image.path);

    print(file.parent);
    

    //  final response = await http.post(
    //   url,         
    //   body: {
    //     "name": "$name",
    //     "description": "$detail",
    //     "logo": file,
    //     "food_type": category[0] 
    //   }   
    // ).timeout(Duration(milliseconds: 20000)); 


    // print(response.body);
    // var request = http.MultipartRequest(
    //     'POST', Uri.parse(url),
    // );

    // Map<String,String> headers={      
    //   "Content-type": "multipart/form-data"
    // };   
    // request.headers.addAll(headers);

    // request.fields.addAll({
    //   "name": "$name",
    //   "description": "$detail",
      
    // });

    // var _stream =  await file.readAsBytes().asStream();
    // var _length = await file.length();    
 

    // request.files.add(
    //     http.MultipartFile(
    //        "logo",
    //         _stream,
    //         _length,
    //         filename: basename(file.path),
    //       // contentType: MediaType('image','jpeg'),
    //     ),
    // );
    
    // request.fields['food_type'] = category[0];
   
 
    // print("request: "+request.toString());
    // var res = await request.send();
    // res.stream.transform(utf8.decoder).listen((value) {                        
    //       print(value);
        
    //     });   
    // return res.statusCode;


  }

  Future<void> createNewReviwtService({@required String name, @required String email, @required String raiting,@required String coment  } ) async 
  {
    
    final String ur = Constant.url;
    final String url = '$ur/api/reviews/';   

    print(name);
    print(email);
    print(raiting);
    print(coment);   

     final response = await http.post(
      url,         
      body: {
        "restaurant": name,
        "email": email,
        "comments": coment ,
        "rating": raiting
      } 
    ).timeout(Duration(milliseconds: 20000)); 


    print(response.body);



  }












}