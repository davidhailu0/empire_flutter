import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;

  SplashController({required this.sharedPreferences});
  int _index = 0;

  int get index => _index;

  void changeView(int index) {
    _index = index;
    update();
  }

  void disableIntro() async {
    await sharedPreferences.setBool("showIntro", true);
  }

  bool introShown() {
    return sharedPreferences.getBool("showIntro") ?? false;
  }
}
