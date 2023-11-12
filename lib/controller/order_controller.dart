import 'package:empire_flutter/helper/api_request.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController implements GetxService {
  final APIRequest apiRequest;
  final SharedPreferences sharedPreferences;
  OrderController({required this.apiRequest, required this.sharedPreferences});
}
