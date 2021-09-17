import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app2/cubit/cubit.dart';
import 'package:shop_app2/cubit/states.dart';
import 'package:shop_app2/myData/cachehelper.dart';
import 'package:shop_app2/myData/diohelper.dart';
import 'package:shop_app2/screens/homeScreen.dart';
import 'package:shop_app2/screens/login/loginScreen.dart';
import 'package:shop_app2/screens/pageviewscreen.dart';

import 'myData/observar.dart';
import 'myData/shared.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init() ;
  await CacheHelper.init() ;
   bool onBoarding  =  CacheHelper.getData(key: "onBoarding") ;
    token =  CacheHelper.getData(key: "token") ;
   print(token) ;
 Widget widget ;
  if(onBoarding!=null)
  {
    if(token!=null){
      widget = HomeScreen() ;
    }
    else
      {
        widget = LoginScreen() ;
      }
  }
  else{
    widget = PageScreen() ;
  }
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final startWidget ;


  const MyApp(this.startWidget);
  @override
  Widget build(BuildContext context) {
   
    return BlocProvider<ShopCubit>(
      create: (context)=>ShopCubit()..getHomeData()..getCategory()..getFavourite()..getProfile(),
      child: BlocConsumer<ShopCubit , ShopAppStates>(
        listener: (context , state){},
        builder: (context , state)=>MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              color: Colors.deepPurple ,
              titleTextStyle: TextStyle(
                color: Colors.white ,
                fontSize: 18 ,
                wordSpacing: 2 ,

              )
            ) ,
          ),
          debugShowCheckedModeBanner: false,
          home : startWidget,
        ),
      ),
    );
  }
}


