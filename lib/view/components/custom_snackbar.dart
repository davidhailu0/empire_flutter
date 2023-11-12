import 'package:empire_flutter/util/dimensions.dart';
import 'package:empire_flutter/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String? message,
    {bool isError = true, showToaster = false}) {
  if (message != null && message.isNotEmpty) {
    if (showToaster && !GetPlatform.isWeb) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: isError ? Colors.red : Colors.green,
        textColor: Colors.white,
        fontSize: Dimensions.fontSizeDefault,
      );
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.horizontal,
        margin: const EdgeInsets.only(
          right: Dimensions.small,
          top: Dimensions.small,
          bottom: Dimensions.small,
          left: Dimensions.small,
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.small)),
        content:
            Text(message, style: robotoMedium.copyWith(color: Colors.white)),
      ));
    }
  }
}
