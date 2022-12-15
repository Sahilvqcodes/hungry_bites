import 'package:hunger_bites/Admin/models/add_shops_model.dart';

class AvailableShops {
  ShopsData? data;

  AvailableShops({this.data});

  AvailableShops.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ShopsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ShopsData {
  String? sId;
  String? name;
  String? status;
  String? profile;
  List<ProductId>? productId;
  int? iV;

  ShopsData(
      {this.sId,
      this.name,
      this.status,
      this.profile,
      this.productId,
      this.iV});

  ShopsData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    status = json['status'];
    profile = json['profile'];
    if (json['product_id'] != null) {
      productId = <ProductId>[];
      json['product_id'].forEach((v) {
        productId!.add(new ProductId.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['profile'] = this.profile;
    if (this.productId != null) {
      data['product_id'] = this.productId!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class ProductId {
  String? sId;
  String? name;
  String? address;
  String? phoneNo;
  String? catId;
  String? status;
  String? sortOrder;
  String? shopName;
  String? city;
  String? landMark;
  List<String>? openingDay;
  String? openingTime;
  String? closingTime;
  List<String>? profile;
  List? menuItem;
  int? iV;

  ProductId(
      {this.sId,
      this.name,
      this.address,
      this.phoneNo,
      this.catId,
      this.status,
      this.sortOrder,
      this.shopName,
      this.city,
      this.landMark,
      this.openingDay,
      this.openingTime,
      this.closingTime,
      this.profile,
      this.menuItem,
      this.iV});

  ProductId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    address = json['address'];
    phoneNo = json['phone_no'];
    catId = json['cat_id'];
    status = json['status'];
    sortOrder = json['sort_order'];
    shopName = json['shop_name'];
    city = json['city'];
    landMark = json['land_mark'];
    openingDay = json['opening_day'].cast<String>();
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    profile = json['profile'].cast<String>();
    menuItem = json['menu_item'].cast<String>();
    // if (json['menu_item'] != null) {
    //   menuItem = <Null>[];
    //   json['menu_item'].forEach((v) {
    //     menuItem!.add(new Null.fromJson(v));
    //   });
    // }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone_no'] = this.phoneNo;
    data['cat_id'] = this.catId;
    data['status'] = this.status;
    data['sort_order'] = this.sortOrder;
    data['shop_name'] = this.shopName;
    data['city'] = this.city;
    data['land_mark'] = this.landMark;
    data['opening_day'] = this.openingDay;
    data['opening_time'] = this.openingTime;
    data['closing_time'] = this.closingTime;
    data['profile'] = this.profile;
    // if (this.menuItem != null) {
    data['menu_item'] = this.menuItem;
    // }
    data['__v'] = this.iV;
    return data;
  }
}
