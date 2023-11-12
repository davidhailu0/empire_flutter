import 'package:empire_flutter/model/onboarding_model.dart';
import 'package:empire_flutter/util/images.dart';

class AppConstants {
  static const appName = "Erkata";
  static const baseUrl = "http://192.168.8.6:5000/api/v1";
  static const appVersion = "1.0.0";
  static const fontFamily = "Roboto";
  static const splashMessageFirstLine = "Welcome to Better Life Alternative.";
  static const splashMessageSecondLine = "We are ready to serve you!";

  static const registerRoute = "/register";
  static const loginRoute = "/login";
  static const refreshTokenUrl = "/refreshToken";

  static const accessToken = "accessToken";
  static const refreshToken = "refreshToken";
}

List<OnBoardingModel> onboardingData = [
  OnBoardingModel(
      image: Images.customer,
      title: "Buy any Product you like",
      description: "Get the product you want to buy"),
  OnBoardingModel(
      image: Images.service,
      title: "Sell any Products that you have",
      description: "Using our platform you can reach many customers")
];

List<String> userRoles = ["Customer", "Agent", "Seller"];
