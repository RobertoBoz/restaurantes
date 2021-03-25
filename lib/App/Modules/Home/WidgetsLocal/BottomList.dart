import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:restaurantes/App/Modules/Home/Home_Controller.dart';

class DrageList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      // id: 'review',
      builder: (_) => DraggableScrollableSheet(        
        initialChildSize: 0.14,
        minChildSize: 0.14,
        maxChildSize: 0.5,        
        builder: (BuildContext context, ScrollController controller){
          return Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(43, 49, 95,1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              )
            ), 
            child: ListaItems(scrollcontroller: controller,),         

          );

        },
      )
    );
  }
}

class ListaItems extends StatelessWidget {
  
  final ScrollController scrollcontroller;

  const ListaItems({@required this.scrollcontroller});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'review',
        builder: (_) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        controller: this.scrollcontroller,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 20,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  width: 30,height: 5,
                )
              )
            ),            
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:<Widget >[
                  Text('Email',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  Text('Comentario',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  Text('Pedidos',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                ]
                
              ),
            ),
            Column(
              children: (_.flag == 0) ? _.reviewsitem : _.reviewfiltro,
            )

          ],
        )            
      )
    );
  }
}

class ItemReview extends StatelessWidget {

  final String email;
  final String coment;
  final String puntuacion;

  const ItemReview({    
    @required this.email , 
    @required this.coment, 
    @required this.puntuacion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(          
          top: BorderSide( 
            color: Colors.white,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10,top:10 ),
            
            width: MediaQuery.of(context).size.width * 0.30,
            child: Center(child: Text(this.email,style: TextStyle(color: Colors.white,fontSize: 10),))
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10,top:10 ),
            width: MediaQuery.of(context).size.width * 0.30,
            child: Center(child: Text(this.coment,style: TextStyle(color: Colors.white,fontSize: 10),))
          ),        
          Container(
            width: MediaQuery.of(context).size.width * 0.30,
            child: Center(child: Text(this.puntuacion,style: TextStyle(color: Colors.white,fontSize: 10),))
          ),
        ],

      ),
    );
  }
}



