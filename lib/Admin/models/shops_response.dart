class ShopsResponse {
  String? message;
  Products? products;

  ShopsResponse({this.message, this.products});

  ShopsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    return data;
  }
}

class Products {
  String? name;
  String? categoryType;
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
  String? sId;
  int? iV;

  Products(
      {this.name,
      this.categoryType,
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
      this.sId,
      this.iV});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    categoryType = json['Category_type'];
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
    profile = json['menu_item'].cast<String>();
    // if (json['menu_item'] != null) {
    //   menuItem = <Null>[];
    //   json['menu_item'].forEach((v) {
    //     menuItem!.add(new Null.fromJson(v));
    //   });
    // }
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['Category_type'] = this.categoryType;
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
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
