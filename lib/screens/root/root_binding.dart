import 'package:get/get.dart';
import 'package:tiktok_clone/screens/root/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootController());
  }

}