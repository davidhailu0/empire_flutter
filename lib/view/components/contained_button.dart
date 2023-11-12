import 'package:empire_flutter/util/dimensions.dart';
import 'package:empire_flutter/util/styles.dart';
import 'package:flutter/material.dart';

class CustomContainedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  const CustomContainedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.small)),
          foregroundColor: Colors.white,
        ),
        child: Text(
          text,
          style: robotoRegular.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
