import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CreativeController extends GetxController {
  CameraController? cameraController;
  RxBool isCameraInitialized = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    initCamera();
  }

  @override
  void onClose() {
    super.onClose();
    cameraController?.dispose();
  }

  void initCamera() async {
    try {
      final cameras = await availableCameras();
      cameraController = CameraController(
        cameras.first,
        ResolutionPreset.high,
      );
      await cameraController?.initialize();
      isCameraInitialized.value = true;
    } catch (e) {
      errorMessage.value = e.toString();
    }
  }
}