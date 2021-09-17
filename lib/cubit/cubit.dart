import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app2/cubit/states.dart';
import 'package:shop_app2/models/HomeModel.dart';
import 'package:shop_app2/models/catModel.dart';
import 'package:shop_app2/models/changefavmodel.dart';
import 'package:shop_app2/models/getfavouriteModel.dart';
import 'package:shop_app2/models/searchmodel.dart';
import 'package:shop_app2/models/userModel.dart';
import 'package:shop_app2/myData/cachehelper.dart';
import 'package:shop_app2/myData/diohelper.dart';
import 'package:shop_app2/myData/shared.dart';
import 'package:shop_app2/screens/CategoryScreen.dart';
import 'package:shop_app2/screens/FavouriteScreen.dart';
import 'package:shop_app2/screens/comedatascreen.dart';
import 'package:shop_app2/screens/login/loginScreen.dart';
import 'package:shop_app2/screens/settingscreen.dart';

class ShopCubit extends Cubit<ShopAppStates>{
  ShopCubit():super(ShopAppInitialState());
 static ShopCubit get(context)=> BlocProvider.of(context) ;
 bool isTrue = true ;
 Map favourite = {} ;
 List<Widget> screens= [ HomeDataScreen() , CategoryScreen() , FavouriteScreen() ,//SettingScreen()
   ] ;
 int currentIndex = 0 ;
 changeBottomNavBar(index){
   currentIndex = index ;
   emit(ChangeBottomNavBarState());
 }
 IconData suffix = Icons.visibility_off_outlined ;
 changeIcon(){
   isTrue = ! isTrue ;
   if(isTrue==true){
     suffix = Icons.visibility_off_outlined ;
     emit(ShopAppChangeIconState()) ;
   }
   else{
     suffix = Icons.visibility_outlined ;
     emit(ShopAppChangeIconState()) ;
   }
 }
 LoginModel userModel ;
 userLogin({@required email , @required password ,}){
   emit(ShopAppLoginLoadingState());
   DioHelper.postData(url: 'login',
       data: { 'email':email,
            'password': password,
        }).then((value) {
           userModel = LoginModel.fromJson(value.data) ;
          emit(ShopAppLoginSuccessState()) ;
   }).catchError((error){
     print(error) ;
     emit(ShopAppLoginErrorState(error.toString())) ;
   }) ;
 }
 HomeModel homeModel ;
 getHomeData(){
   emit(ShopAppGetHomeDataLoadingState()) ;
   DioHelper.getData(url: 'home'  , token:  token , lang: 'en' ).
   then((value) {
     homeModel = HomeModel.fromJson(value.data) ;
     // print(homeModel.status.toString()) ;
     // print(homeModel.data.banners[0].image);
     homeModel.data.products.forEach((element) {

       favourite.addAll({
         element.id : element.inFavourite,
       }) ;
     }) ;
     print(favourite.toString());
      emit(ShopAppGetHomeDataSuccessState()) ;
   }).catchError((error){
     emit(ShopAppGetHomeDataErrorState(error)) ;
   }) ;
 }
 //categories
  CategoryModel categoryModel ;
 getCategory(){
   emit(ShopAppGetCategoryDataLoadingState()) ;
   DioHelper.getData(url: 'categories' , token: token).
   then((value){
     categoryModel = CategoryModel.fromJson(value.data) ;
     print("Catg Done") ;
     print(value.data.image);
     emit(ShopAppGetCategoryDataSuccessState()) ;
   }
   ).
   catchError((error){
     emit(ShopAppGetCategoryDataErrorState(error.toString())) ;
   }) ;

 }
 FavouriteModel favouriteModel ;
 getFavourite(){
   emit(ShopAppGetFavouriteDataLoadingState()) ;
   DioHelper.getData(url: 'favorites' , token: token).then((value) {
     favouriteModel = FavouriteModel.fromJson(value.data) ;
     print("Fav Success") ;
     emit(ShopAppGetFavouriteDataSuccessState()) ;
   }).catchError((error){
     emit(ShopAppGetFavouriteDataErrorState(error)) ;
   }) ;
 }
 ChangeFavModel changeFavModel ;
 changeFav(productId)
 {
   //emit(ShopAppGetChangeFavouriteDataLoadingState()) ;
    favourite[productId] =!  favourite[productId] ;
   emit(ShopAppGetChangeFavouriteDataSuccessState()) ;
  DioHelper.postData(url: 'favorites',
      data: {"product_id" :productId } ,
      token:  token ,
      ).then((value) {
        changeFavModel = ChangeFavModel.fromJson(value.data) ;
        getFavourite() ;
    emit(ShopAppGetChangeFavouriteDataSuccessState()) ;
  }).catchError((error){

    emit(ShopAppGetChangeFavouriteDataErrorState(error)) ;
  }) ;
 }
 SearchModel searchModel ;
 search(text){
   emit(ShopAppGetSearchDataLoadingState()) ;
   DioHelper.postData(url: 'products/search', data: {"text" :text}).then((value) {
       searchModel = SearchModel.fromJson(value.data) ;
       print("Search is okay ") ;
     emit(ShopAppGetSearchDataSuccessState()) ;
   }).catchError((error){
     emit(ShopAppGetSearchDataErrorState(error)) ;
   }) ;
 }

  signOut(context){
   CacheHelper.removeData(key: "token").then((value) {
     navigatorAndReplacment(context, LoginScreen()) ;
   });
  }

  getProfile(){
   emit(ShopAppGetProfileDataLoadingState()) ;
    DioHelper.getData(url: 'profile' , token:  token  ).then((value){
      print("Profile is okay ") ;
      userModel = LoginModel.fromJson(value.data) ;
      emit(ShopAppGetProfileDataSuccessState()) ;
    }).catchError((error){
      emit(ShopAppGetProfileDataErrorState(error)) ;
    }) ;
  }

  LoginModel updateModel ;

 updateProfile({
    @required name ,
    @required phone ,
    @required email ,
  }){
   emit(ShopAppUpdateProfileDataLoadingState()) ;
   DioHelper.putData(url: 'update-profile',
       data: {
        "name" :name ,
         "email" : email,
         "phone" :phone ,
       }
   , token:  token).then((value)
   {
     updateModel = LoginModel.fromJson(value.data) ;
     print("updated") ;
      emit(ShopAppUpdateProfileDataSuccessState()) ;
   }).
   catchError((error){
     emit(ShopAppUpdateProfileDataErrorState(error)) ;
   }) ;
  }
}