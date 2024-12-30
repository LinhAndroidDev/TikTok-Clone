import 'package:get/get.dart';
import 'package:tiktok_clone/screens/edit_photo/edit_photo_controller.dart';

class EditPhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditPhotoController());
  }

}