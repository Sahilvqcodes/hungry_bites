import 'package:get/get.dart';
import 'package:hunger_bites/User/screens/shopsDetails/controller/shops_controller.dart';

class ShopsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopsController>(
      () => ShopsController(),
    );
  }
}
