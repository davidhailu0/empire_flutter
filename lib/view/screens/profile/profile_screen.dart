import 'package:empire_flutter/util/app_constants.dart';
import 'package:empire_flutter/util/dimensions.dart';
import 'package:empire_flutter/util/images.dart';
import 'package:empire_flutter/util/styles.dart';
import 'package:empire_flutter/view/components/appbar.dart';
import 'package:empire_flutter/view/components/custom_image.dart';
import 'package:empire_flutter/view/components/footer_view.dart';
import 'package:empire_flutter/view/components/profile_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    initCall();
  }

  void initCall() {
    // if (Get.find<AuthController>().isLoggedIn() &&
    //     Get.find<UserController>().userInfoModel == null) {
    //   Get.find<UserController>().getUserInfo();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Profile"),
        endDrawerEnableOpenDragGesture: false,
        backgroundColor: Theme.of(context).cardColor,
        body: Center(
          child: SingleChildScrollView(
            child: FooterView(
              minHeight: 0.6,
              child: Container(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                width: Get.width,
                height: context.height,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.extraLarge,
                            vertical: Dimensions.extraLarge),
                        child: Row(children: [
                          const ClipOval(
                              child: CustomImage(
                            placeholder: Images.profile,
                            image: '',
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                          )),
                          const SizedBox(width: Dimensions.defaultSize),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Admin',
                                    style: robotoBold.copyWith(
                                        fontSize:
                                            Dimensions.fontSizeExtraLarge),
                                  ),
                                  const SizedBox(height: Dimensions.small),
                                ]),
                          ),
                          InkWell(
                            onTap: () => {
                              // Get.toNamed(
                              //     RouteHelper.getUpdateProfileRoute())
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).cardColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.05),
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                        offset: const Offset(3, 3))
                                  ]),
                              padding:
                                  const EdgeInsets.all(Dimensions.extraSmall),
                              child: const Icon(Icons.edit_outlined,
                                  size: 24, color: Colors.blue),
                            ),
                          )
                        ]),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(Dimensions.extraLarge)),
                            color: Theme.of(context).colorScheme.background,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.large,
                              vertical: Dimensions.defaultSize),
                          child: Column(children: [
                            const SizedBox(height: Dimensions.large),
                            const SizedBox(height: Dimensions.defaultSize),
                            const SizedBox(height: Dimensions.small),
                            ProfileButton(
                                icon: Icons.lock,
                                title: "Change Password",
                                onTap: () {
                                  // Get.toNamed(
                                  //     RouteHelper.getResetPasswordRoute(
                                  //         '', '', 'password-change'));
                                }),
                            const SizedBox(height: Dimensions.small),
                            ProfileButton(
                              icon: Icons.delete,
                              iconImage: Images.deleteProfile,
                              title: "Delete Account",
                              onTap: () {
                                // Get.toNamed(RouteHelper.deleteAccount);
                              },
                            ),
                            const SizedBox(height: Dimensions.large),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Version',
                                      style: robotoRegular.copyWith(
                                          fontSize:
                                              Dimensions.fontSizeExtraSmall)),
                                  const SizedBox(width: Dimensions.small),
                                  Text(AppConstants.appVersion.toString(),
                                      style: robotoMedium.copyWith(
                                          fontSize:
                                              Dimensions.fontSizeExtraSmall)),
                                ]),
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
