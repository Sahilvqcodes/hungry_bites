import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../notificationService/local_notification.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) async {
        print("FirebaseMessaging.onMessageOpenedApp.listen");

        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
    NavigationFunction();
  }

  NavigationFunction() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? type = sharedPreferences.getString("type");
    String? catId = sharedPreferences.getString("catId");
    String? productId = sharedPreferences.getString("productsId");
    Timer(
      Duration(milliseconds: 1500),
      () {
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
      },
    );
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
