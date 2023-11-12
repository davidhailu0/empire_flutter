import 'package:empire_flutter/helper/route_helper.dart';
import 'package:empire_flutter/theme/light_theme.dart';
import 'package:empire_flutter/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "./helper/get_init.dart" as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: light,
      initialRoute: RouteHelper.onboard,
      getPages: RouteHelper.routes,
    );
  }
}
