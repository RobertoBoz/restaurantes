import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantes/App/Data/Models/Category.dart';
import 'package:restaurantes/App/Modules/Home/Home_Controller.dart';

class Categoria extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'cat',
      builder: (_) => Container(
        height: 30,
        child: ListView.builder(                        
          scrollDirection: Axis.horizontal,
          itemCount: _.cat.length,
          itemBuilder: (BuildContext context, int index) => ItemCategoria(index: index,categori: _.cat[index])                                                            
        )                      
      )
    );
  }
}




class ItemCategoria extends StatelessWidget {
  final int index;
  final Cat categori;
  const ItemCategoria({
    this.index, 
    this.categori,
    
  });

  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<HomeController>(
    id: 'cat',
    builder: (_) => GestureDetector(
       
        onTap: () {_.onchangefiltro(index);},
        child: (_.flag == 0) ? Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: 30,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.primaries[index % Colors.primaries.length],
            borderRadius: BorderRadius.circular(30),
            
          ),
          child: Center(child: Text(categori.name,style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,color: Colors.white),)),
        
        ) : (_.currentFiltro == index) ? Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: 30,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
            
          ),
          child: Center(child: Text('X',style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,color: Colors.white),)),
        
        ) : Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: 30,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.primaries[index % Colors.primaries.length],
            borderRadius: BorderRadius.circular(30),
            
          ),
          child: Center(child: Text(categori.name,style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,color: Colors.white),)),
        
        ),
      ),
    );
  }
}