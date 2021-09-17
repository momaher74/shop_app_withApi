class HomeModel {
  bool status;

  DataModel data;

  HomeModel.fromJson(json) {
    status = json['status'];
    data = DataModel.fromJson(json['data']);
  }
}

class DataModel {
  List banners = [];

  List products = [];

  DataModel.fromJson(json) {
    json['banners'].forEach((element) {
      banners.add(BannerModel.fromJson(element));
    });
    json['products'].forEach((element) {
      products.add(ProductModel.fromJson(element));
    });
  }
}

class BannerModel {
  int id;
  String image;

  BannerModel.fromJson(json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel {
  dynamic oldPrice, discount, price, id;
  String name, image, description;

  bool inFavourite, inCart;

  ProductModel.fromJson(json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    inFavourite = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
