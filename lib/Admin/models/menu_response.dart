class AddItemRespone {
  String? message;
  AddItemResponeData? data;

  AddItemRespone({this.message, this.data});

  AddItemRespone.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null
        ? new AddItemResponeData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AddItemResponeData {
  String? itemName;
  String? itemDetails;
  String? price;
  String? discount;
  String? profile;
  String? productId;
  String? catId;
  String? sId;
  int? iV;

  AddItemResponeData(
      {this.itemName,
      this.itemDetails,
      this.price,
      this.discount,
      this.profile,
      this.productId,
      this.catId,
      this.sId,
      this.iV});

  AddItemResponeData.fromJson(Map<String, dynamic> json) {
    itemName = json['item_name'];
    itemDetails = json['item_details'];
    price = json['price'];
    discount = json['discount'];
    profile = json['profile'];
    productId = json['product_id'];
    catId = json['cat_id'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_name'] = this.itemName;
    data['item_details'] = this.itemDetails;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['profile'] = this.profile;
    data['product_id'] = this.productId;
    data['cat_id'] = this.catId;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
