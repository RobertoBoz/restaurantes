import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:restaurantes/App/Modules/Home/Home_Controller.dart';



class Carrusel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'carusel',
      builder: (_) => Container(        
        // color: Colors.deepOrange,
        height: MediaQuery.of(context).size.height * 0.50,      
        child: (_.flag == 0) ? PageView.builder(
          physics: BouncingScrollPhysics(),
          controller: PageController(
            viewportFraction: 0.7
          ),
          onPageChanged: (page) { _.onpageChange(page);},
          itemCount: _.rest.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemsCarrusel(
              index: index,
              image:  _.rest[index].logo,
               title: _.rest[index].name, 
               itemselected: _.currentPage == index,              
            );
          }
        ): PageView.builder(
          physics: BouncingScrollPhysics(),
          controller: PageController(
            viewportFraction: 0.7
          ),
          onPageChanged: (page) { _.onpageChange(page);},
          itemCount: _.restfiltro.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemsCarrusel(
              index: index,
              image:  _.restfiltro[index].logo,
               title: _.restfiltro[index].name, 
               itemselected: _.currentPage == index,              
            );
          }
        )
      )
    );
  }
}


class ItemsCarrusel extends StatelessWidget {

  final int index; 
  final String title; 
  final String image;
  final List<Color> background; 
  final bool itemselected ;
  
  ItemsCarrusel({
    this.index,
    this.title,
    this.image, 
    this.itemselected, 
    this.background,
    
  }) ;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(         
      builder: (_) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints ){
          final double itemHeight = constraints.maxHeight *0.80;
          final double itemWidth = constraints.maxWidth *0.9;

          final double itemHeightnoselected = constraints.maxHeight *0.6;
          final double itemWidthnoselected = constraints.maxWidth *0.7;

          return Center(
            child: Container(
              decoration: BoxDecoration(                                
                borderRadius: BorderRadius.circular(30),
                boxShadow:  <BoxShadow>[
                  BoxShadow(                  
                    color: Colors.black,
                    blurRadius: 10.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                    offset: Offset(
                      0.0, // Move to right 10  horizontally
                      3.0, // Move to bottom 10 Vertically
                      ),
                  )
                ],
              ),           
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: GestureDetector(
                  onTap: () => null,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      
                      borderRadius: BorderRadius.circular(30),                      
                    ),           
                    height: (itemselected) ? itemHeight :itemHeightnoselected ,
                    width: (itemselected) ? itemWidth : itemWidthnoselected ,
                    child: Center(
                      child: Stack(
                        children: [
                          // Image.network('$image',fit: BoxFit.cover,),
                          Center(
                            child: Container(
                              height: 150,
                              child: Image.network('$image',fit:BoxFit.cover, )
                            ),
                          ),
                          Container(
                            child: Text(
                              '$title',
                              style: TextStyle(fontSize: 20,color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          alignment: Alignment.bottomCenter,padding: EdgeInsets.only(bottom: 20),),
                        ],
                      )
                    ),
                  ),
                ),
              ),
            ),
          );
        },      
      )
    );
  }
}