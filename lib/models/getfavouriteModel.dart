class FavouriteModel {
  bool status ;
  FavouriteDataModel data ;
  FavouriteModel.fromJson(json){
    status = json['status'] ;
    data = FavouriteDataModel.fromJson(json['data']) ;
  }
}
class FavouriteDataModel {
 int currentPage ;
 List data = [] ;
 FavouriteDataModel.fromJson(json){
   currentPage = json['currentPage'] ;
   json['data'].forEach((element) {
     data.add(DataModel.fromJson(element));
   });
 }
}
class DataModel {
  int id ;
  Products product ;
  DataModel.fromJson(json){
    id = json['id'] ;
    product = Products.fromJson(json['product']);
  }
}
class Products{
  dynamic id , price  , oldPrice , discount ;
  String image , name ;
  Products.fromJson(json){
    id = json['id'] ;
    price = json['price'] ;
    oldPrice = json['oldPrice'] ;
    discount = json['discount'] ;
    image = json['image'] ;
    name = json['name'] ;
  }
}