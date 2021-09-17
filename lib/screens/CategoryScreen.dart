import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app2/cubit/cubit.dart';
import 'package:shop_app2/cubit/states.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = ShopCubit.get(context) ;
    var model = cubit.categoryModel;
    return BlocConsumer <ShopCubit , ShopAppStates>(
      listener: (context , state){},
      builder: (context , state){
        return Container(
          child:  model==null ? Center(child: CircularProgressIndicator())  :
          Container(
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
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Text("Categories" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 24 , letterSpacing: 1.5  ,color: Colors.white ),) ,
                    SizedBox(height: 20,) ,
                    ListView.builder(
                       physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context , index){return
                      Column(
                        children: [
                          Row(children: [
                            Image(image: NetworkImage( model.data.data[index].image!=null?"${model.data.data[index].image}":"https://image.freepik.com/free-vector/season-sale_62951-24.jpg" ) ,width: 100 , height: 100,)  ,
                            SizedBox(width: 16,) ,
                            Text("${model.data.data[index].name}" ,style: TextStyle( fontSize: 16 , letterSpacing: 1.5 ,color: Colors.white ),) ,

                          ],) ,
                          SizedBox(height: 20,) ,
                          Container(
                            padding: EdgeInsets.all(8),
                            height: 1, color: Colors.white,
                            width: double.infinity,
                          ) ,
                          SizedBox(height: 20,) ,
                        ],
                      )
                    ;} , shrinkWrap: true, itemCount: model.data.data.length,)
                  ],
                ),
              ),
            ),
          ),
        ) ;
      },
    );
  }
}
