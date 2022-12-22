import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    NavigationFunction();
  }

  NavigationFunction() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? type = sharedPreferences.getString("type");
    String? catId = sharedPreferences.getString("catId");
    String? productId = sharedPreferences.getString("productsId");
    Timer(Duration(milliseconds: 1500), () {
      type == "user"
          ? Navigator.pushNamed(context, '/home')
          : type == "owner"
              ? Navigator.pushNamed(context, '/admin_home')
              : type == "admin"
                  ? Navigator.pushNamed(context, '/owner_home_page',
                      arguments: [catId, productId])
                  : Navigator.pushNamed(
                      context,
                      '/home',
                    );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          "assets/images/logo.png",
          scale: 8,
          // fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
