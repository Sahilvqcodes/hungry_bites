class CategoryList {
  List<Data>? data;

  CategoryList({this.data});

  CategoryList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? status;
  String? profile;
  List<ProductIds>? productId;
  int? iV;

  Data(
      {this.sId,
      this.name,
      this.status,
      this.profile,
      this.productId,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    status = json['status'];
    profile = json['profile'];
    if (json['product_id'] != null) {
      productId = <ProductIds>[];
      json['product_id'].forEach((v) {
        productId!.add(new ProductIds.fromJson(v));
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

class ProductIds {
  String? sId;
  String? name;
  String? categoryType;
  String? address;
  String? phoneNo;
  String? catId;
  String? status;
  String? sortOrder;
  List<String>? menuItem;
  int? iV;

  ProductIds(
      {this.sId,
      this.name,
      this.categoryType,
      this.address,
      this.phoneNo,
      this.catId,
      this.status,
      this.sortOrder,
      this.menuItem,
      this.iV});

  ProductIds.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    categoryType = json['Category_type'];
    address = json['address'];
    phoneNo = json['phone_no'];
    catId = json['cat_id'];
    status = json['status'];
    sortOrder = json['sort_order'];
    menuItem = json['menu_item'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['Category_type'] = this.categoryType;
    data['address'] = this.address;
    data['phone_no'] = this.phoneNo;
    data['cat_id'] = this.catId;
    data['status'] = this.status;
    data['sort_order'] = this.sortOrder;
    data['menu_item'] = this.menuItem;
    data['__v'] = this.iV;
    return data;
  }
}
