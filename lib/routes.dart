import 'package:flutter/cupertino.dart';
import 'package:hunger_bites/Admin/screens/addShops/addItems.dart';
import 'package:hunger_bites/Admin/screens/addShops/add_category_shops.dart';
import 'package:hunger_bites/Admin/screens/addShops/add_shops.dart';
import 'package:hunger_bites/Admin/screens/addShops/shops_profile.dart';
import 'package:hunger_bites/Admin/screens/admin_home.dart';
import 'package:hunger_bites/Admin/screens/category_Shops_list.dart';
import 'package:hunger_bites/User/screens/category_shop_list.dart';
import 'package:hunger_bites/forgot_password.dart';
import 'package:hunger_bites/sign_in.dart';
import 'package:hunger_bites/User/screens/splash_screen.dart';

import 'Sign_up.dart';
import 'User/screens/details_screen.dart';
import 'User/screens/home/view/home_page.dart';
import 'User/screens/super_market.dart';

class Routes {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String restourant = '/category_shop_list';
  static const String adminCategoryShopList = '/admin_category_shop_list';
  static const String admin_home = '/admin_home';
  static const String add_category_shops = '/add_category_shops';
  static const String add_shops = '/add_shops';
  static const String shops_profile = '/shops_profile';
  static const String add_items = '/add_items';
  static const String details_page = '/details_page';
  static const String super_market = '/super_market';
  static const String forgot_password = '/forgot_password';

  static Map<String, WidgetBuilder> routes = {
    '/splash': (context) => SplashScreen(),
    '/home': (context) => HomePage(),
    '/signIn': (context) => SignIn(),
    '/signUp': (context) => SignUp(),
    '/category_shop_list': (context) => CategoryShopList(),
    '/admin_home': (context) => AdminHomePage(),
    '/admin_category_shop_list': (context) => AdminCategoryShopList(),
    '/add_category_shops': (context) => AddCategoryShops(),
    '/add_shops': (context) => AddShops(),
    '/shops_profile': (context) => ShopsProfile(),
    '/add_items': (context) => AddItems(),
    '/details_page': (context) => DetailsScreen(),
    '/super_market': (context) => SuperMarket(),
    '/forgot_password': (context) => ForgotPassword()
  };
}
