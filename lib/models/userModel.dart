class LoginModel{
  bool status ;
String   message  ;
DataModel data ;
 LoginModel.fromJson(json){
   status = json['status'] ;
   message = json['message'] ;
   data = DataModel.fromJson(json['data'])  ;
 }

}
class DataModel{
  int id  ;
 String name , email , phone , image , token ;
  DataModel.fromJson(json){
    id= json['id'] ;
    name= json['name'] ;
    token= json['token'] ;
    email= json['email'] ;
    phone= json['phone'] ;
    image= json['image'] ;
  }
}