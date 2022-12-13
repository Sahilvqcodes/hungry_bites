import 'package:flutter/cupertino.dart';
import 'package:hunger_bites/Admin/screens/add_category_shops.dart';
import 'package:hunger_bites/Admin/screens/admin_home.dart';
import 'package:hunger_bites/Admin/screens/category_Shops_list.dart';
import 'package:hunger_bites/User/screens/category_shop_list.dart';
import 'package:hunger_bites/User/screens/sign_in.dart';
import 'package:hunger_bites/User/screens/splash_screen.dart';

import 'User/screens/Sign_up.dart';
import 'User/screens/home/view/home_page.dart';

class Routes {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String restourant = '/category_shop_list';
  static const String adminCategoryShopList = '/admin_category_shop_list';
  static const String admin_home = '/admin_home';
  static const String add_category_shops = '/add_category_shops';

  static Map<String, WidgetBuilder> routes = {
    '/splash': (context) => SplashScreen(),
    '/home': (context) => HomePage(),
    '/signIn': (context) => SignIn(),
    '/signUp': (context) => SignUp(),
    '/category_shop_list': (context) => CategoryShopList(),
    '/admin_home': (context) => AdminHomePage(),
    '/admin_category_shop_list': (context) => AdminCategoryShopList(),
    '/add_category_shops': (context) => AddCategoryShops(),
  };
}
