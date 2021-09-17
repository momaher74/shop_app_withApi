import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app2/cubit/cubit.dart';
import 'package:shop_app2/cubit/states.dart';
import 'package:shop_app2/models/searchmodel.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var model = ShopCubit.get(context).searchModel ;
    return BlocConsumer<ShopCubit , ShopAppStates>(
      listener: (context , state){},
      builder: (context , state){
        return Scaffold(
          appBar: AppBar(),
          body: Container(
           height: 800,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.deepPurple[800],
                    Colors.deepPurple[700],
                    Colors.deepPurple[600],
                    Colors.deepPurple[400],
                  ],
                )
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: 20,) ,
                      TextFormField(
                        key: formKey,
                        decoration: InputDecoration(
                            icon: Icon(Icons.search , color: Colors.white,),
                            labelText: "Search here" ,
                            labelStyle: TextStyle(color:Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                        validator: (value){
                          if(value.isEmpty)
                            return "enter text" ;
                          else
                            return null ;
                        },
                        onFieldSubmitted: (String value){
                          ShopCubit.get(context).search(value) ;
                        },
                      ) ,
                      SizedBox(height: 20,) ,
                      if(state is ShopAppGetSearchDataLoadingState)
                        SizedBox(height: 20 ,),
                      if(state is ShopAppGetSearchDataLoadingState)
                        CircularProgressIndicator() ,
                      if(state is ShopAppGetSearchDataSuccessState)
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: ShopCubit.get(context).searchModel.data.data.length,
                            itemBuilder: (context , index){
                              return productBuilder(model, index, context) ;
                            }

                        )

                    ],
                  ),
                ),
              ),
            ),
          ),
        ) ;
      },
    );
  }

  productBuilder( SearchModel model, index  , context){
    var product = model.data.data[index];
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
