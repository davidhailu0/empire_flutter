import 'package:empire_flutter/controller/splash_controller.dart';
import 'package:empire_flutter/helper/route_helper.dart';
import 'package:empire_flutter/util/app_constants.dart';
import 'package:empire_flutter/util/dimensions.dart';
import 'package:empire_flutter/util/styles.dart';
import 'package:empire_flutter/view/components/contained_button.dart';
import 'package:empire_flutter/view/components/outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<SplashController>(
          builder: (splahsController) {
            return Column(
              children: [
                SizedBox(
                  height: context.height * 0.65,
                  width: context.width,
                  child: PageView.builder(
                    itemCount: 2,
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(context.height * 0.05),
                            child: Image.asset(onboardingData[index].image!,
                                height: context.height * 0.4),
                          ),
                          Text(
                            onboardingData[index].title!,
                            style: robotoMedium.copyWith(
                                fontSize: context.height * 0.035,
                                color: Theme.of(context).primaryColor),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: context.height * 0.025),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.large),
                            child: Text(
                              onboardingData[index].description!,
                              style: robotoRegular.copyWith(
                                  fontSize: context.height * 0.025,
                                  color: Theme.of(context).disabledColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: context.height * 0.015,
                          )
                        ],
                      );
                    },
                    onPageChanged: (value) =>
                        splahsController.changeView(value),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: Dimensions.small,
                      width: Dimensions.small,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 1),
                          color: splahsController.index == 0
                              ? Theme.of(context).primaryColor
                              : Colors.white),
                    ),
                    const SizedBox(
                      width: Dimensions.small,
                    ),
                    Container(
                      height: Dimensions.small,
                      width: Dimensions.small,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 1),
                          color: splahsController.index == 1
                              ? Theme.of(context).primaryColor
                              : Colors.white),
                    ),
                    const SizedBox(
                      width: Dimensions.small,
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(Dimensions.large),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomOutlineddButton(
                            text: "Skip",
                            width: 150,
                            onPressed: () {
                              Get.find<SplashController>().disableIntro();
                              Get.toNamed(RouteHelper.dashboard);
                            }),
                        CustomContainedButton(
                            text: "Next",
                            width: 150,
                            onPressed: () {
                              if (splahsController.index == 1) {
                                Get.find<SplashController>().disableIntro();
                                Get.toNamed(RouteHelper.dashboard);
                              } else {
                                _pageController.nextPage(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.ease);
                              }
                            })
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
