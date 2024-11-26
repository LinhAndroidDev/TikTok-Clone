import 'package:get/get.dart';
import 'package:tiktok_clone/screens/creative/creative_controller.dart';

class CreativeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreativeController());
  }

}