import 'package:get/get.dart';
import 'package:tiktok_clone/screens/message/message_controller.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageController());
  }

}