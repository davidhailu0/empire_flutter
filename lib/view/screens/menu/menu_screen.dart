import 'package:empire_flutter/helper/route_helper.dart';
import 'package:empire_flutter/util/dimensions.dart';
import 'package:empire_flutter/util/images.dart';
import 'package:empire_flutter/util/styles.dart';
import 'package:empire_flutter/view/components/custom_image.dart';
import 'package:empire_flutter/view/components/portion_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MenuScreenNew extends StatefulWidget {
  const MenuScreenNew({Key? key}) : super(key: key);

  @override
  State<MenuScreenNew> createState() => _MenuScreenNewState();
}

class _MenuScreenNewState extends State<MenuScreenNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        body: Column(children: [
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Padding(
              padding: const EdgeInsets.only(
                left: Dimensions.overLarge,
                right: Dimensions.overLarge,
                top: 50,
                bottom: Dimensions.overLarge,
              ),
              child: Row(children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(1),
                  child: const ClipOval(
                      child: CustomImage(
                    placeholder: Images.profile,
                    image: '',
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  )),
                ),
                const SizedBox(width: Dimensions.defaultSize),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Admin",
                          style: robotoBold.copyWith(
                              fontSize: Dimensions.fontSizeExtraLarge,
                              color: Theme.of(context).cardColor),
                        ),
                        const SizedBox(height: Dimensions.extraSmall),
                      ]),
                ),
              ]),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Ink(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              padding: const EdgeInsets.only(top: Dimensions.large),
              child: Column(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.defaultSize),
                    child: Text(
                      "General",
                      style: robotoMedium.copyWith(
                          fontSize: Dimensions.fontSizeDefault,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius:
                          BorderRadius.circular(Dimensions.defaultSize),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 5)
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.large,
                        vertical: Dimensions.defaultSize),
                    margin: const EdgeInsets.all(Dimensions.defaultSize),
                    child: const Column(children: [
                      PortionWidget(
                          icon: Images.profile,
                          title: "Profile",
                          route: RouteHelper.profile),
                      // PortionWidget(
                      //     icon: Images.addressIcon,
                      //     title: 'my_address'.tr,
                      //     route: RouteHelper.getAddressRoute())
                    ]),
                  )
                ]),
                // Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                //   Padding(
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: Dimensions.paddingSizeDefault),
                //     child: Text(
                //       'promotional_activity'.tr,
                //       style: robotoMedium.copyWith(
                //           fontSize: Dimensions.fontSizeDefault,
                //           color:
                //               Theme.of(context).primaryColor.withOpacity(0.5)),
                //     ),
                //   ),
                //   Container(
                //     decoration: BoxDecoration(
                //       color: Theme.of(context).cardColor,
                //       borderRadius:
                //           BorderRadius.circular(Dimensions.radiusDefault),
                //       boxShadow: const [
                //         BoxShadow(
                //             color: Colors.black12,
                //             spreadRadius: 1,
                //             blurRadius: 5)
                //       ],
                //     ),
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: Dimensions.paddingSizeLarge,
                //         vertical: Dimensions.paddingSizeDefault),
                //     margin: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                //     child: Column(children: [
                //       PortionWidget(
                //           icon: Images.couponIcon,
                //           title: 'coupon'.tr,
                //           route:
                //               RouteHelper.getCouponRoute(fromCheckout: false)),
                //       (Get.find<SplashController>()
                //                   .configModel!
                //                   .loyaltyPointStatus ==
                //               1)
                //           ? PortionWidget(
                //               icon: Images.pointIcon,
                //               title: 'loyalty_points'.tr,
                //               route: RouteHelper.getWalletRoute(false),
                //               hideDivider: Get.find<SplashController>()
                //                           .configModel!
                //                           .customerWalletStatus ==
                //                       1
                //                   ? false
                //                   : true,
                //               suffix: !isLoggedIn
                //                   ? null
                //                   : '${userController.userInfoModel?.loyaltyPoint != null ? Get.find<UserController>().userInfoModel!.loyaltyPoint.toString() : '0'} ${'points'.tr}',
                //             )
                //           : const SizedBox(),
                //       (Get.find<SplashController>()
                //                   .configModel!
                //                   .customerWalletStatus ==
                //               1)
                //           ? PortionWidget(
                //               icon: Images.walletIcon,
                //               title: 'my_wallet'.tr,
                //               hideDivider: true,
                //               route: RouteHelper.getWalletRoute(true),
                //               suffix: !isLoggedIn
                //                   ? null
                //                   : PriceConverter.convertPrice(
                //                       userController.userInfoModel != null
                //                           ? Get.find<UserController>()
                //                               .userInfoModel!
                //                               .walletBalance
                //                           : 0),
                //             )
                //           : const SizedBox(),
                //     ]),
                //   )
                // ]),
                // Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                //   Padding(
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: Dimensions.paddingSizeDefault),
                //     child: Text(
                //       'earnings'.tr,
                //       style: robotoMedium.copyWith(
                //           fontSize: Dimensions.fontSizeDefault,
                //           color:
                //               Theme.of(context).primaryColor.withOpacity(0.5)),
                //     ),
                //   ),
                //   Container(
                //     decoration: BoxDecoration(
                //       color: Theme.of(context).cardColor,
                //       borderRadius:
                //           BorderRadius.circular(Dimensions.radiusDefault),
                //       boxShadow: const [
                //         BoxShadow(
                //             color: Colors.black12,
                //             spreadRadius: 1,
                //             blurRadius: 5)
                //       ],
                //     ),
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: Dimensions.paddingSizeLarge,
                //         vertical: Dimensions.paddingSizeDefault),
                //     margin: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                //     child: Column(children: [
                //       (Get.find<SplashController>()
                //                   .configModel!
                //                   .refEarningStatus ==
                //               1)
                //           ? PortionWidget(
                //               icon: Images.referIcon,
                //               title: 'refer_and_earn'.tr,
                //               route: RouteHelper.getReferAndEarnRoute(),
                //             )
                //           : const SizedBox(),
                //       (Get.find<SplashController>()
                //                   .configModel!
                //                   .toggleDmRegistration! &&
                //               !ResponsiveHelper.isDesktop(context))
                //           ? PortionWidget(
                //               icon: Images.dmIcon,
                //               title: 'join_as_a_delivery_man'.tr,
                //               route:
                //                   RouteHelper.getDeliverymanRegistrationRoute(),
                //             )
                //           : const SizedBox(),
                //       (Get.find<SplashController>()
                //                   .configModel!
                //                   .toggleRestaurantRegistration! &&
                //               !ResponsiveHelper.isDesktop(context))
                //           ? PortionWidget(
                //               icon: Images.storeIcon,
                //               title: 'open_store'.tr,
                //               hideDivider: true,
                //               route:
                //                   RouteHelper.getRestaurantRegistrationRoute(),
                //             )
                //           : const SizedBox(),
                //     ]),
                //   )
                // ]),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.defaultSize),
                    child: Text(
                      'help_and_support'.tr,
                      style: robotoMedium.copyWith(
                          fontSize: Dimensions.fontSizeDefault,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius:
                          BorderRadius.circular(Dimensions.defaultSize),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 5)
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.large,
                        vertical: Dimensions.defaultSize),
                    margin: const EdgeInsets.all(Dimensions.defaultSize),
                    child: Column(children: []),
                  )
                ]),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: Dimensions.small),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                            child: Icon(Icons.power_settings_new_sharp,
                                size: 14, color: Theme.of(context).cardColor),
                          ),
                          const SizedBox(width: Dimensions.extraSmall),
                          Text("Log Out", style: robotoMedium)
                        ]),
                  ),
                ),
                const SizedBox(height: Dimensions.overLarge)
              ]),
            ),
          )),
        ]));
  }
}
