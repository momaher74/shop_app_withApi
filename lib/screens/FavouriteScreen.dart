import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app2/cubit/cubit.dart';
import 'package:shop_app2/cubit/states.dart';
import 'package:shop_app2/models/getfavouriteModel.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = ShopCubit.get(context) ;
    var model = ShopCubit.get(context).favouriteModel ;

    return BlocConsumer <ShopCubit , ShopAppStates>(
      listener: (context , state){

      },
      builder: (context , state){
        return Container(
          child:  cubit.favouriteModel==null ? Center(child: CircularProgressIndicator())  :
          Container(
            height: double.infinity ,
            width: double.infinity ,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple[800],
                    Colors.deepPurple[700],
                    Colors.deepPurple[600],
                    Colors.deepPurple[400],
                  ]
              ) ,
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Text("Favourites" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 24 , letterSpacing: 1.5  ,color: Colors.white ),) ,
                    // Image(image: NetworkImage("${model.data.data[0].product.image}")) ,
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                       itemCount: model.data.data.length,
                      itemBuilder: (context , index) {return
                        productBuilder(model, index, context) ;})
                  ],
                ),
              ),
            ),
          ),
        ) ;
      },
    );
  }

  productBuilder( FavouriteModel model, index  , context){
    var product = model.data.data[index].product  ;
    var homeModel = ShopCubit.get(context).homeModel ;
    var favModel = ShopCubit.get(context).favouriteModel ;
    return Padding(

      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2 ,
            childAspectRatio: 1/1.2,
            shrinkWrap: true,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [
              Container(
                child :  Image(image:
                NetworkImage("${
                    product.image
                }"),  height: 220, ) ,
              ) ,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name , maxLines: 3 , overflow: TextOverflow.ellipsis, style: TextStyle( color: Colors.white ),) ,
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(product.price.toString() , maxLines: 3 , overflow: TextOverflow.ellipsis, style: TextStyle( color: Colors.white ),) ,
                      Spacer(),
                      if(homeModel.data.products[index].discount!=0)
                        Text(homeModel.data.products[index].oldPrice.toString() , maxLines: 3 , overflow: TextOverflow.ellipsis, style: TextStyle( color: Colors.grey , decoration: TextDecoration.lineThrough ),) ,
                    ],
                  ),
                  SizedBox(height: 12,),
                  if(homeModel.data.products[index].discount!=0)
                    Container(
                      width :185 ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text( "discount " , maxLines: 3 , overflow: TextOverflow.ellipsis, style: TextStyle( color: Colors.red ),) ,
                        ],
                      ),
                    ),
                  Row(children: [
                    Text("Add to Fav" ,  style: TextStyle( color: Colors.cyan ),) ,
                    SizedBox(width: 8,) ,
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: ShopCubit.get(context).favourite[product.id] ?  Colors.blue :  Colors.grey,
                      child: IconButton(icon: Icon(Icons.favorite_border_sharp , color: Colors.white,), onPressed:
                          (){
                        ShopCubit.get(context).changeFav(product.id);
                        ShopCubit.get(context).getFavourite() ;
                        print("Fav");
                      }),
                    )
                  ],),

                ],
              ),

            ],
          ) ,
          SizedBox(height: 8,) ,
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 1,
          ) ,
          SizedBox(height: 8,) ,
        ],
      ),
    ) ;
  }
}
