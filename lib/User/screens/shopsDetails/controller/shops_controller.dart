import 'package:get/get.dart';
import 'package:hunger_bites/Admin/models/available_items.dart';

class ShopsController extends GetxController {
  var wishlisItems = <MenuItems>[].obs;
  var wishlisIds = [].obs;
  var addedItemToCart = [].obs;
  var addedMenuItemsToCart = <MenuItems>[].obs;
  var similarItems = [].obs;
  var itemCounter = 0.obs;
  var listSimilarData = [].obs;
  var cartMenuItems = <MenuItems>[].obs;
  RxString productId = "".obs;
  // String? productId = Get.arguments;
  void onInit() {
    productId.value = Get.arguments ?? "";
    // print(Get.arguments);
    print("productId.... $productId");
    super.onInit();
  }
}
