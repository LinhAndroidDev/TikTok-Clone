import 'package:get/get.dart';
import 'package:tiktok_clone/screens/discover/discover_controller.dart';

class DiscoverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiscoverController());
  }

}