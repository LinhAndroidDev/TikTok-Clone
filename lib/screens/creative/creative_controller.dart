import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreativeController extends GetxController with GetTickerProviderStateMixin {
  CameraController? cameraController;
  RxBool isCameraInitialized = false.obs;
  RxString errorMessage = ''.obs;
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    initCamera();
    tabController = TabController(length: 3, vsync: this);
    tabController.offset = 1;
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