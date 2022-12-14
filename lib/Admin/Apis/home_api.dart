import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hunger_bites/Admin/screens/add_category.dart';
import 'package:image_picker/image_picker.dart';

import '../../User/model/category_list.dart';
import '../models/add_shops_model.dart';

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

  static AddShops(
      BuildContext context, Shops shops, List<XFile> imageList) async {
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
        "category_type": "Restaurants",
        "subscription": "free",
        "address": shops.address,
        "phone_no": shops.mobileNo,
        "cat_id": "63996204f9d54cf617f71140",
        "status": "active",
        "sort_order": "5",
        "city": shops.city,
        "land_mark": shops.landMark,
        "opening_day": shops.openingDays,
        "opening_time": shops.openingTime,
        "closing_time": shops.closingTime,
        "profile": galleryImage
      }),
    );
    if (res.statusCode == 201) {
      // Navigator.pushNamed(context, "active");
      print("AddShops ${res.body}");
    }
    print(res.body);
  }
}
