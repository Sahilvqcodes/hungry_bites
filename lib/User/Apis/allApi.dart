import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hunger_bites/Admin/models/available_items.dart';
import 'package:hunger_bites/User/model/user_details_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Admin/models/available_shops.dart';
import '../../forgot_password.dart';
import '../../sign_in.dart';

bool isChecked = false;

class UserApis {
  static RegisterUser(BuildContext context, String? email, String? name,
      String? password, String? username) async {
    final http.Response res = await http.post(
      Uri.parse('http://157.245.97.144:8000/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "name": name!,
        "username": username!,
        "password": password!,
        "email": email!,
        "type": "user"
      }),
    );
    print(res.body);
    var userDetails = UserDetails.fromJson(jsonDecode(res.body));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString('type', userDetails.data!.type ?? "");
    sharedPreferences.setString('email', userDetails.data!.email ?? "");
    sharedPreferences.setString('name', userDetails.data!.name ?? "");

    print(userDetails.message);
    if (userDetails.message == "User Signup successfully") {
      Navigator.pushNamed(context, "/home");
    }
  }

  static getUsersProductList(String categoryId) async {
    print("categoryId $categoryId");
    String url = 'http://157.245.97.144:8000/find-category/$categoryId';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    String json = response.body;
    // print(response.body);
    AvailableShops _availableShops =
        AvailableShops.fromJson(jsonDecode(response.body));
    print("_availableShops $_availableShops");

    return _availableShops;
  }

  static getUsersMenuList(String productId) async {
    print("productId $productId");
    String url = 'http://157.245.97.144:8000/find-Products/$productId';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    String json = response.body;
    // print(response.body);
    AvailableItems _availableItems =
        AvailableItems.fromJson(jsonDecode(response.body));
    print("_availableItems $_availableItems");

    return _availableItems;
  }

  static forgotPasswordApi(
      BuildContext context, String? password, String? email) async {
    final http.Response res = await http.post(
      Uri.parse('https://fd62-122-160-167-80.in.ngrok.io/update_password'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email!,
        "password": password!,
      }),
    );
    Map<String, dynamic> output = jsonDecode(res.body);
    if (output["message"] == "Password has been Updated!") {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Password Changed Successfully!",
        // desc: "Flutter is more awesome with RFlutter Alert.",
        buttons: [
          DialogButton(
            child: Text(
              "Done",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              // Navigator.pushReplacementNamed(
              //     context, "/admin_category_shop_list",
              //     arguments: [
              //       shops.category,
              //       shops.categoryId,
              //     ]);
            },
            width: 120,
          )
        ],
      ).show();
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "User Not Found!",
        // desc: "Flutter is more awesome with RFlutter Alert.",
        buttons: [
          DialogButton(
            child: const Text(
              "Done",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              // Navigator.pushReplacementNamed(
              //     context, "/admin_category_shop_list",
              //     arguments: [
              //       shops.category,
              //       shops.categoryId,
              //     ]);
            },
            width: 120,
          )
        ],
      ).show();
    }
  }

  static LoginMethod(
      BuildContext context, String? password, String? email) async {
    final http.Response res = await http.post(
      Uri.parse('http://157.245.97.144:8000/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email!,
        "password": password!,
      }),
    );
    print(res.body);
    var userDetails = UserDetails.fromJson(jsonDecode(res.body));
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('type', userDetails.data!.type ?? "");
    sharedPreferences.setString('email', userDetails.data!.email ?? "");
    sharedPreferences.setString('name', userDetails.data!.name ?? "");
    print(sharedPreferences.getString('type'));
    print(userDetails.message);
    if (userDetails.message == "Login Successfully " &&
        userDetails.data!.type == "user") {
      Navigator.pushNamed(context, "/home");
    } else if (userDetails.message == "Login Successfully " &&
        userDetails.data!.type == "owner") {
      Navigator.pushNamed(context, "/admin_home");
      // if (isChecked) {
      //   _remeberMe();
      //   print("SharedPreferences${_remeberMe}");
      // }
    } else if (userDetails.message == "Login Successfully " &&
        userDetails.data!.type == "admin") {
      sharedPreferences.setString('catId', userDetails.data!.catId ?? "");
      sharedPreferences.setString(
          'productsId', userDetails.data!.productsId ?? "");
      Navigator.pushNamed(context, "/owner_home_page",
          arguments: [userDetails.data!.catId, userDetails.data!.productsId]);
    } else if (userDetails.message == "User not register ") {
      Alert(
        context: context,
        type: AlertType.warning,
        title: "Invalid Email/Password",
        // desc: "Flutter is more awesome with RFlutter Alert.",
        buttons: [
          DialogButton(
            child: Text(
              "Done",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              // Navigator.pushReplacementNamed(
              //     context, "/admin_category_shop_list",
              //     arguments: [
              //       shops.category,
              //       shops.categoryId,
              //     ]);
            },
            width: 120,
          )
        ],
      ).show();
    }
  }
}

// void _remeberMe() {
//   print("share ${_remeberMe}");

//   SharedPreferences.getInstance().then(
//     (prefs) {
//       prefs.setBool("remember_me", true);

//       prefs.setString('email', user.email ?? "");
//       prefs.setString('password', user.password ?? "");
//       // print("SharedPreferences${_remeberMe}");
//     },
//   );
// }

// User user = User();
