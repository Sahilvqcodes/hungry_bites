import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      // iOS: IOSInitializationSettings(
      //   requestSoundPermission: false,
      //   requestBadgePermission: false,
      //   requestAlertPermission: false,

      //   // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      // ),
    );

    _notificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: (String? id) async {
      //   print("onSelectNotification");
      //   if (id!.isNotEmpty) {
      //     print("Router Value1234 $id");

      //     Navigator.of(context).push(
      //       MaterialPageRoute(builder: (context) => UserOfferList()),
      //     );
      //   }
      // },
    );
    // print("jdjcjc");
  }

  static void createanddisplaynotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "pushnotificationbyadmin",
          "pushnotificationbyadminchannel",
          importance: Importance.max,
          priority: Priority.high,
          icon: "@mipmap/ic_launcher",
        ),
        // iOS: IOSNotificationDetails(
        //   presentAlert:
        //       true, // Present an alert when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
        //   presentBadge:
        //       true, // Present the badge number when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
        //   presentSound:
        //       true, // Play a sound when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
        //   // sound: "",  // Specifics the file path to play (only from iOS 10 onwards)
        //   // badgeNumber: 1, // The application's icon badge number
        //   // attachments:
        //   // subtitle: "", //Secondary description  (only from iOS 10 onwards)
        //   // threadIdentifier: ""
        // ),
      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print("error For Forground $e");
    }
  }
}
