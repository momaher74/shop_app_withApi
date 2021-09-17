import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app2/cubit/cubit.dart';
import 'package:shop_app2/cubit/states.dart';
import 'package:shop_app2/models/HomeModel.dart';

class HomeDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = ShopCubit.get(context);
    var model = ShopCubit.get(context).homeModel;
    var cat = ShopCubit.get(context).categoryModel;
    return BlocConsumer<ShopCubit, ShopAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          child: model == null
              ? Center(child: CircularProgressIndicator())
              : Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.deepPurple[800],
                Colors.deepPurple[700],
                Colors.deepPurple[600],
                Colors.deepPurple[400],
              ]),
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    CarouselSlider(
                        items: model.data.banners
                            .map((e) =>
                            Image(image: NetworkImage("${e.image}")))
                            .toList(),
                        options: CarouselOptions(
                          height: 200 ,
                          viewportFraction: 1.0,
                          aspectRatio: 1.5,
                          autoPlay: true ,
                          autoPlayAnimationDuration: Duration(milliseconds: 600) ,
                        )) ,
                    SizedBox(height: 22,) ,
                    Text("Products" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 24 , letterSpacing: 1.5 ,color: Colors.white ),) ,
                    SizedBox(height: 10,) ,
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                      itemBuilder: (context , index){
                        return productBuilder(model, index , context);} ,
                      itemCount: model.data.products.length,
                                    ),

                  ],
                ),
              ),
            ),

          ),
        )  ;
      },
    );
  }
 productBuilder( HomeModel model, index  , context)=> Padding(
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

             child :  Image(image: NetworkImage("${
                 model.data.products[index].image
             }"),  height: 220, ) ,
           ) ,
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text( model.data.products[index].name , maxLines: 3 , overflow: TextOverflow.ellipsis, style: TextStyle( color: Colors.white ),) ,
               SizedBox(height: 12,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text( model.data.products[index].price.toString() , maxLines: 3 , overflow: TextOverflow.ellipsis, style: TextStyle( color: Colors.white ),) ,
                   Spacer(),
                   if(model.data.products[index].discount!=0)
                   Text( model.data.products[index].oldPrice.toString() , maxLines: 3 , overflow: TextOverflow.ellipsis, style: TextStyle( color: Colors.grey , decoration: TextDecoration.lineThrough ),) ,
                 ],
               ),
               SizedBox(height: 12,),
               if(model.data.products[index].discount!=0)
                 Container(
                   width :185 ,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text( "discount " , maxLines: 3 , overflow: TextOverflow.ellipsis, style: TextStyle( color: Colors.red ),) ,
                     ],
                   ),
                 ),
              SizedBox(height: 10,) ,
              Row(children: [
                Text("Add to Fav" ,  style: TextStyle( color: Colors.cyan ),) ,
                SizedBox(width: 25,) ,
                CircleAvatar(
                  radius: 22,
                  backgroundColor: ShopCubit.get(context).favourite[model.data.products[index].id] ?  Colors.blue :  Colors.grey,
                  child: IconButton(icon: Icon(Icons.favorite_border_sharp , color: Colors.white,), onPressed:
                      (){
                    ShopCubit.get(context).changeFav(model.data.products[index].id);
                    print("Fav");
                  }),
                )
              ],) ,
             ],
           )

         ],
       ) ,
       SizedBox(height: 20,) ,
       Container(
         width: double.infinity,
         height: 2,
         color: Colors.white,
       ),
     ],
   ),
 ) ;

}
