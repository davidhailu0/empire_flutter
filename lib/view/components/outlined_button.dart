import 'package:empire_flutter/util/dimensions.dart';
import 'package:empire_flutter/util/styles.dart';
import 'package:flutter/material.dart';

class CustomOutlineddButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  const CustomOutlineddButton(
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
      child: OutlinedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.small)),
            foregroundColor: Theme.of(context).primaryColor,
            side: BorderSide(color: Theme.of(context).primaryColor)),
        child: Text(
          text,
          style: robotoRegular.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
