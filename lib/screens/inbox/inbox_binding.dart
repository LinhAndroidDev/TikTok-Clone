import 'package:get/get.dart';
import 'package:tiktok_clone/screens/inbox/inbox_controller.dart';

class InboxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InboxController());
  }

}