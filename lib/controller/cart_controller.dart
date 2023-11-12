import 'package:empire_flutter/helper/api_request.dart';
import 'package:empire_flutter/model/product_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController implements GetxService {
  final APIRequest apiRequest;
  final SharedPreferences sharedPreferences;

  final List<Product> _cartList = [];
  CartController({required this.apiRequest, required this.sharedPreferences});

  List<Product> get cartList => _cartList;

  void addToCart(Product product) {
    _cartList.add(product);
  }
}
