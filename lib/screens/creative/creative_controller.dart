import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../widget/dialog/dialog_warning_fail_camera.dart';

class CreativeController extends GetxController with GetTickerProviderStateMixin {
  CameraController? cameraController;
  RxBool isCameraInitialized = false.obs;
  RxString errorMessage = ''.obs;
  late TabController tabController;
  final ImagePicker _picker = ImagePicker();
  Rx<File?> selectedImage = Rx<File?>(null);

  @override
  void onInit() async {
    super.onInit();
    await requestCameraPermission();
    initCamera();
    checkShowDialogWaningFailCamera();
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

  void checkShowDialogWaningFailCamera() {
    if (errorMessage.value.isNotEmpty) {
      Get.dialog(
        DialogWarningFailCamera(
          onTabConfirm: () {
            // Đóng dialog
            Get.back();
            // Quay về màn hình trước đó
            Get.back();
          },
        ),
        barrierDismissible: false,
      );
    }
  }

  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  Future<void> requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();
    if (status.isGranted) {
      print('Camera permission granted');
    } else {
      print('Camera permission denied');
    }
  }
}