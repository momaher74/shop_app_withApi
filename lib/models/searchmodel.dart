import 'dart:convert';

class SearchModel{
  bool status ;
  SearchDataModel data ;
  SearchModel.fromJson(json){
    status= json['status'] ;
    data = SearchDataModel.fromJson(json['data']) ;
  }
}
class SearchDataModel{
  List data = [] ;
  SearchDataModel.fromJson(json){
    json['data'].forEach((element) {
      data.add(Product.fromJson(element)) ;
    }) ;
  }
}
class Product{
  dynamic id , price  ;
  String name , image ;
  bool inFav  , inCart;
  Product.fromJson(json){
    id = json['id'] ;
    price = json['price'] ;
    name = json['name'] ;
    image = json['image'] ;
    inFav = json['inFav'] ;
    inCart = json['inCart'] ;
  }
}