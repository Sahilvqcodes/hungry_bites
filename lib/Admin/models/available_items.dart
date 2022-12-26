class AvailableItems {
  ItemsData? data;

  AvailableItems({this.data});

  AvailableItems.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ItemsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ItemsData {
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
  String? Category_type;
  List<String>? profile;
  List<MenuItems>? menuItem;
  int? iV;

  ItemsData(
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
      this.Category_type,
      this.iV});

  ItemsData.fromJson(Map<String, dynamic> json) {
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
    Category_type = json['Category_type'];
    if (json['menu_item'] != null) {
      menuItem = <MenuItems>[];
      json['menu_item'].forEach((v) {
        menuItem!.add(new MenuItems.fromJson(v));
      });
    }
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
    data['Category_type'] = this.Category_type;
    data['profile'] = this.profile;
    if (this.menuItem != null) {
      data['menu_item'] = this.menuItem!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class MenuItems {
  String? sId;
  String? itemName;
  String? itemDetails;
  String? price;
  String? discount;
  String? profile;
  String? productId;
  String? catId;

  int? iV;

  MenuItems(
      {this.sId,
      this.itemName,
      this.itemDetails,
      this.price,
      this.discount,
      this.profile,
      this.productId,
      this.catId,
      this.iV});

  MenuItems.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    itemName = json['item_name'];
    itemDetails = json['item_details'];
    price = json['price'];
    discount = json['discount'];
    profile = json['profile'];
    productId = json['product_id'];
    catId = json['cat_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['item_name'] = this.itemName;
    data['item_details'] = this.itemDetails;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['profile'] = this.profile;
    data['product_id'] = this.productId;
    data['cat_id'] = this.catId;
    data['__v'] = this.iV;
    return data;
  }
}
