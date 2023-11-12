import "package:flutter/material.dart";
import "package:get/get.dart";

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;
  const CustomAppBar({super.key, required this.title, this.bottom});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
      ),
      centerTitle: true,
      bottom: bottom,
      elevation: 20,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size(Get.width, 50);
}
