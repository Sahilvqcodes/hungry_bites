class UserDetails {
  String? message;
  UserData? data;

  UserDetails({this.message, this.data});

  UserDetails.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
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

class UserData {
  String? type;
  String? name;
  String? username;
  String? email;
  String? sId;
  String? productId;

  UserData(
      {this.type,
      this.name,
      this.username,
      this.email,
      this.sId,
      this.productId});

  UserData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    sId = json['_id'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['_id'] = this.sId;
    data['product_id'] = this.productId;
    return data;
  }
}
