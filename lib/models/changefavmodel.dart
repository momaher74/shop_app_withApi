class ChangeFavModel {
  bool status ;
  String message ;
  ChangeFavModel.fromJson(json){
    status = json['status'] ;
    message = json['message'] ;
  }
}