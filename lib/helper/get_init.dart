import "package:get/get.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../controller/cart_controller.dart";
import "../controller/order_controller.dart";
import "../controller/splash_controller.dart";
import "api_request.dart";

Future<void> init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => APIRequest(sharedPreferences: sharedPreferences));
  Get.lazyPut(() => SplashController(sharedPreferences: sharedPreferences));
  Get.lazyPut(() => CartController(
      apiRequest: Get.find<APIRequest>(),
      sharedPreferences: sharedPreferences));
  Get.lazyPut(() => OrderController(
      apiRequest: Get.find<APIRequest>(),
      sharedPreferences: sharedPreferences));
}
