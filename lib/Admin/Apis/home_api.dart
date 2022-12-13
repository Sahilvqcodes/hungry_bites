import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hunger_bites/Admin/screens/add_category.dart';

import '../../User/model/category_list.dart';

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

    print("_categoryList_categoryList $_categoryList");

    return _categoryList;
  }

  static AddCategory(String? categoryName, File? imagePath) async {
    debugPrint(categoryName!, wrapWidth: 1024);
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
    print(res.body);
  }
}
