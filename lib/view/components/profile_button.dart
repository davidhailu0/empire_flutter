import 'package:empire_flutter/util/dimensions.dart';
import 'package:empire_flutter/util/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final IconData? icon;
  final String title;
  final bool? isButtonActive;
  final Function onTap;
  final Color? color;
  final String? iconImage;
  const ProfileButton(
      {Key? key,
      this.icon,
      required this.title,
      required this.onTap,
      this.isButtonActive,
      this.color,
      this.iconImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.small,
          vertical: isButtonActive != null
              ? Dimensions.extraSmall
              : Dimensions.defaultSize,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(Dimensions.defaultSize),
          border: Border.all(color: Theme.of(context).primaryColor, width: 0.1),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5)
          ],
        ),
        child: Row(children: [
          iconImage != null
              ? Image.asset(iconImage!, height: 18, width: 25)
              : Icon(icon,
                  size: 25,
                  color:
                      color ?? Theme.of(context).textTheme.bodyMedium!.color),
          const SizedBox(width: Dimensions.small),
          Expanded(child: Text(title, style: robotoRegular)),
          isButtonActive != null
              ? Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    value: isButtonActive!,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (bool? value) => onTap(),
                    trackColor: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                )
              : const SizedBox()
        ]),
      ),
    );
  }
}
