import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hunger_bites/Admin/models/add_items_model.dart';
import 'package:hunger_bites/Admin/screens/addShops/add_shops.dart';
import 'package:hunger_bites/Admin/screens/add_category.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../User/model/category_list.dart';
import '../models/add_shops_model.dart';
import '../models/available_items.dart';
import '../models/available_shops.dart';
import '../models/menu_response.dart';
import '../models/shops_response.dart';

class HomePageApi {
  static getCategoryList() async {
    String url = 'http://157.245.97.144:8000/find-category';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    String json = response.body;
    print(response.body);
    CategoryList _categoryList =
        CategoryList.fromJson(jsonDecode(response.body));

    return _categoryList;
  }

  static getShopsList(String categoryId) async {
    String url = 'http://157.245.97.144:8000/find-category/$categoryId';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    String json = response.body;
    print(response.body);
    AvailableShops _availableShops =
        AvailableShops.fromJson(jsonDecode(response.body));
    print("_availableShops $_availableShops");

    return _availableShops;
  }

  static getMenuItemsList(String productId) async {
    print("productId $productId");
    String url = 'http://157.245.97.144:8000/find-products/$productId';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    String json = response.body;
    print(response.body);
    AvailableItems _availableItems =
        AvailableItems.fromJson(jsonDecode(response.body));
    print("_availableShops $_availableItems");

    return _availableItems;
  }

  static deleteProducts(context, String id) async {
    final http.Response response = await http.delete(
      Uri.parse('http://157.245.97.144:8000/delete_products-category/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var responseData = jsonDecode(response.body);
    if (responseData["message"] == "Product Delete Successfully") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(
              height: 300,
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/success_icon.png",
                    scale: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Product Deleted Successfully",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 80,
                      // margin: EdgeInsets.only(right: 30),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "OK",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return response;
  }

  static deleteMenuItems(context, String id) async {
    final http.Response response = await http.delete(
      Uri.parse('http://157.245.97.144:8000/delete-menuItem/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var responseData = jsonDecode(response.body);
    print(response.body);
    if (responseData["message"] == "MenuItem Delete Successfully") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(
              height: 300,
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/success_icon.png",
                    scale: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Item Deleted Successfully",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 80,
                      // margin: EdgeInsets.only(right: 30),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "OK",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return response;
  }

  static AddCategory(
      BuildContext context, String? categoryName, File? imagePath) async {
    var imageBytes = imagePath!.readAsBytesSync();
    String baseimage = base64Encode(imageBytes);
    print(baseimage);
    String url = 'http://157.245.97.144:8000/category';
    final http.Response res = await http.post(
      Uri.parse('http://157.245.97.144:8000/category'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "name": categoryName!,
        "status": "active",
        "profile": baseimage,
      }),
    );
    if (res.statusCode == 201) {
      Navigator.pop(context, "active");
    }
    print(res.body);
  }

  static AddMenuItems(BuildContext context, Items items) async {
    // print(items.profile);
    if (items.profile == null) {
      items.profile = "";
    }
    print(items.profile);
    final http.Response res = await http.post(
      Uri.parse('http://157.245.97.144:8000/menu_item'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "item_name": items.itemName,
        "item_details": items.itemDetails,
        "price": items.price,
        "discount": items.discount,
        "product_id": items.productId,
        "cat_id": items.categoryId,
        "profile": items.profile,
      }),
    );
    print("AddMenuItems ${res.body}");

    AddItemRespone _addItemRespone =
        AddItemRespone.fromJson(jsonDecode(res.body));

    if (_addItemRespone.message == "MenuItem Added Successfully") {
      // Navigator.pushNamed(context, "active");

      Alert(
        context: context,
        type: AlertType.success,
        title: "Item Added Successfuly",
        // desc: "Flutter is more awesome with RFlutter Alert.",
        buttons: [
          DialogButton(
            child: Text(
              "Done",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      return "done";
    } else if (_addItemRespone.message == "Please all field required") {
      Alert(
        context: context,
        type: AlertType.warning,
        title: "Please all field required",
        // desc: "Flutter is more awesome with RFlutter Alert.",
        buttons: [
          DialogButton(
            child: Text(
              "Done",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Error Found",
        // desc: "Flutter is more awesome with RFlutter Alert.",
        buttons: [
          DialogButton(
            child: Text(
              "Done",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }
    // print(res.body);
  }

  static AddShops(
      BuildContext context, Shops shops, List<XFile> imageList) async {
    print(shops.ownerName);
    print(shops.shopName);
    print(shops.email);
    print(shops.password);
    print(shops.category);
    print(shops.address);
    print(shops.mobileNo);
    print(shops.categoryId);
    print(shops.city);
    print(shops.landMark);
    print(shops.openingDays);
    print(shops.openingTime);
    print(shops.closingTime);
    List<String> galleryImage = [];
    // imageList!.addAll(selectedImages);
    imageList!.forEach((element) {
      File imagePath = File(element.path);
      var imageBytes = imagePath!.readAsBytesSync();
      String baseimage = base64Encode(imageBytes);
      galleryImage!.add(baseimage);
      print(galleryImage);
    });
    final http.Response res = await http.post(
      Uri.parse('http://157.245.97.144:8000/products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "name": shops.ownerName,
        "shop_name": shops.shopName,
        "email": shops.email,
        "password": shops.password,
        "type": "admin",
        "Category_type": shops.category,
        "subscription": "free",
        "address": shops.address,
        "phone_no": shops.mobileNo,
        "cat_id": shops.categoryId,
        "status": "active",
        "sort_order": "0",
        "city": shops.city,
        "land_mark": shops.landMark,
        "opening_day": shops.openingDays,
        "opening_time": shops.openingTime,
        "closing_time": shops.closingTime,
        "profile": galleryImage
      }),
    );
    print("res.body ${res.body}");
    ShopsResponse _shopResponse = ShopsResponse.fromJson(jsonDecode(res.body));
    if (_shopResponse.message == "Product Added Succesfully") {
      // Navigator.pushNamed(context, "active");
      print("AddShops ${res.body}");
      Alert(
        context: context,
        type: AlertType.success,
        title: "Product Added Successfuly",
        // desc: "Flutter is more awesome with RFlutter Alert.",
        buttons: [
          DialogButton(
            child: Text(
              "Done",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pushReplacementNamed(
                context, "/admin_category_shop_list", arguments: [
              _shopResponse.products!.categoryType,
              _shopResponse.products!.catId
            ]),
            width: 120,
          )
        ],
      ).show();
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Error Found!",
        // desc: "Flutter is more awesome with RFlutter Alert.",
        buttons: [
          DialogButton(
            child: Text(
              "Done",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }
    print(res.body);
  }
}
