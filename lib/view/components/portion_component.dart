import "package:empire_flutter/util/dimensions.dart";
import "package:empire_flutter/util/styles.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class PortionWidget extends StatelessWidget {
  final String icon;
  final String title;
  final bool hideDivider;
  final String route;
  final String? suffix;
  const PortionWidget(
      {Key? key,
      required this.icon,
      required this.title,
      required this.route,
      this.hideDivider = false,
      this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(route),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Dimensions.small),
        child: Column(children: [
          Row(children: [
            Image.asset(icon, height: 16, width: 16),
            const SizedBox(width: Dimensions.small),
            Expanded(
                child: Text(title,
                    style: robotoRegular.copyWith(
                        fontSize: Dimensions.fontSizeDefault))),
            suffix != null
                ? Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      borderRadius:
                          BorderRadius.circular(Dimensions.defaultSize),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimensions.extraSmall,
                        horizontal: Dimensions.small),
                    child: Text(suffix!,
                        style: robotoRegular.copyWith(
                            fontSize: Dimensions.fontSizeSmall,
                            color: Theme.of(context).cardColor)),
                  )
                : const SizedBox(),
          ]),
          hideDivider ? const SizedBox() : const Divider()
        ]),
      ),
    );
  }
}
