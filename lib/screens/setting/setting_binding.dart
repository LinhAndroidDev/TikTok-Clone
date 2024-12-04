import 'package:get/get.dart';
import 'package:tiktok_clone/screens/setting/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }

}