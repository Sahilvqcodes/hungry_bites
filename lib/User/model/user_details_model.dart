class UserDetails {
  UserData? data;
  String? message;

  UserDetails({this.data, this.message});

  UserDetails.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class UserData {
  String? sId;
  String? name;
  String? email;
  String? password;
  String? type;
  String? subscription;
  String? catId;
  String? productsId;
  int? iV;

  UserData(
      {this.sId,
      this.name,
      this.email,
      this.password,
      this.type,
      this.subscription,
      this.catId,
      this.productsId,
      this.iV});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    type = json['type'];
    subscription = json['subscription'];
    catId = json['cat_id'];
    productsId = json['products_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['type'] = this.type;
    data['subscription'] = this.subscription;
    data['cat_id'] = this.catId;
    data['products_id'] = this.productsId;
    data['__v'] = this.iV;
    return data;
  }
}
