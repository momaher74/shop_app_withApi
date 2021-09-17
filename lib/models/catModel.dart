class CategoryModel{
  bool status ;
  CategoryDataModel data ;
  CategoryModel.fromJson(json){
    status=json['status'] ;
    data = CategoryDataModel.fromJson(json['data']) ;
  }
}
class CategoryDataModel{
   int currentPage  ;
   List data = [] ;
   CategoryDataModel.fromJson(json){
     currentPage = json['current_Page'];
     json['data'].forEach((element) {
      data.add(DataModel.fromJson(element));
     }) ;
   }
}
class DataModel{
  int id ;
  String name  , image ;
  DataModel.fromJson(json){
    id=json['id'] ;
    name=json['name'] ;
    image=json['image'] ;
  }
}
// class CategoryModel {
//   bool status;
//   String message;
//   Data data;
//
//   CategoryModel({this.status, this.message, this.data});
//
//   CategoryModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   int currentPage;
//   List<InData> inData;
//   String firstPageUrl;
//   int from;
//   int lastPage;
//   String lastPageUrl;
//   Null nextPageUrl;
//   String path;
//   int perPage;
//   Null prevPageUrl;
//   int to;
//   int total;
//
//   Data(
//       {this.currentPage,
//         this.inData,
//         this.firstPageUrl,
//         this.from,
//         this.lastPage,
//         this.lastPageUrl,
//         this.nextPageUrl,
//         this.path,
//         this.perPage,
//         this.prevPageUrl,
//         this.to,
//         this.total});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     if (json['inData'] != null) {
//       inData = new List<InData>();
//       json['inData'].forEach((v) {
//         inData.add(new InData.fromJson(v));
//       });
//     }
//     firstPageUrl = json['first_page_url'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     lastPageUrl = json['last_page_url'];
//     nextPageUrl = json['next_page_url'];
//     path = json['path'];
//     perPage = json['per_page'];
//     prevPageUrl = json['prev_page_url'];
//     to = json['to'];
//     total = json['total'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['current_page'] = this.currentPage;
//     if (this.inData != null) {
//       data['inData'] = this.inData.map((v) => v.toJson()).toList();
//     }
//     data['first_page_url'] = this.firstPageUrl;
//     data['from'] = this.from;
//     data['last_page'] = this.lastPage;
//     data['last_page_url'] = this.lastPageUrl;
//     data['next_page_url'] = this.nextPageUrl;
//     data['path'] = this.path;
//     data['per_page'] = this.perPage;
//     data['prev_page_url'] = this.prevPageUrl;
//     data['to'] = this.to;
//     data['total'] = this.total;
//     return data;
//   }
// }
//
// class InData {
//   int id;
//   String name;
//   String image;
//
//   InData({this.id, this.name, this.image});
//
//   InData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     return data;
//   }
// }
