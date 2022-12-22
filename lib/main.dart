import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunger_bites/Admin/screens/admin_home.dart';
import 'package:hunger_bites/Sign_up.dart';
import 'package:hunger_bites/User/screens/home/view/home_page.dart';

import 'package:hunger_bites/routes.dart';
import 'package:hunger_bites/User/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

var type;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getTemporaryDirectory();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // functionRun() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();

  //   type = sharedPreferences.getString("type");
  //   print(type);
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.splash,
      routes: Routes.routes,

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xffED4322),
          // secondary: const Color(0xFFFFC107),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
    );
  }
}
