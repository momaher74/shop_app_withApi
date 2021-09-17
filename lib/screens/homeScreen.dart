import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app2/cubit/cubit.dart';
import 'package:shop_app2/cubit/states.dart';
import 'package:shop_app2/myData/shared.dart';
import 'package:shop_app2/screens/searchscreen.dart';
import 'package:shop_app2/screens/settingscreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopAppStates>(
      listener: (context , state){} ,
      builder: (context , state){
        var cubit = ShopCubit.get(context) ;
        return  Scaffold(
          appBar: AppBar(title: Text("Salla"), actions: [
            Padding(
                padding: EdgeInsets.only(right: 15),
                child: IconButton(icon: Icon(Icons.search , size: 32, ),  onPressed:(){
                  navigatorTo(context, SearchScreen()) ;
                })) ,
            IconButton(icon: Icon(Icons.person), onPressed: (){
              navigatorTo(context, SettingScreen()) ;
            })
          ],),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: Container(
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
            child: BottomNavigationBar(
              selectedItemColor: Colors.white,
            backgroundColor: Colors.deepPurple[500],
              onTap: (index ){
                  cubit.changeBottomNavBar(index) ;
              },
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home) , label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.dashboard) , label: "Category"),
                BottomNavigationBarItem(icon: Icon(Icons.favorite) , label: "Favourite"),
             //   BottomNavigationBarItem(icon: Icon(Icons.settings) , label: "Setting"),
              ],
            ),
          ),
        ) ;
      } ,
    );
  }
}
