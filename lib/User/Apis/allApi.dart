import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hunger_bites/User/model/user_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    // sharedPreferences.setString('type', userDetails.data!.type ?? "");
    sharedPreferences.setString('type', userDetails.data!.type ?? "");
    sharedPreferences.setString('email', userDetails.data!.email ?? "");
    sharedPreferences.setString('name', userDetails.data!.name ?? "");
    print(userDetails.message);
    if (userDetails.message == "User Signup successfully") {
      Navigator.pushNamed(context, "/home");
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
    }
  }
}
