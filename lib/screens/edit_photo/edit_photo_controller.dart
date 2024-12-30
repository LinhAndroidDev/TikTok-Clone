import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class EditPhotoController extends GetxController {
  final photoPath = ''.obs;
  final points = <Offset>[].obs;
  GlobalKey repaintBoundaryKey = GlobalKey();
  final x = 0.0.obs;
  final y = 0.0.obs;
  final dragItems = <Offset>[].obs;

  @override
  void onInit() {
    super.onInit();
    photoPath.value = Get.arguments;
  }

  Future<void> saveDrawingToGallery(BuildContext context) async {
    try {
      // Yêu cầu quyền lưu trữ nếu cần
      if (await checkAndroidVersion()) {
        RenderRepaintBoundary boundary = repaintBoundaryKey.currentContext!
            .findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: 10.0);
        ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
        Uint8List pngBytes = byteData!.buffer.asUint8List();

        // Lưu ảnh vào thư viện
        final result = await ImageGallerySaver.saveImage(
          pngBytes,
          quality: 100,
          name: "drawing_${DateTime.now().millisecondsSinceEpoch}",
        );

        // Thông báo kết quả
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Đã lưu hình vẽ vào thư viện: $result"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Không có quyền lưu trữ!")),
        );
      }
    } catch (e) {
      print('Lỗi khi lưu ảnh: $e');
    }
  }

  Future<bool> checkAndroidVersion() async {
    bool hasPermission = false;
    bool isAboveAndroid14 = await isAndroid14OrAbove();

    if (isAboveAndroid14) {
      hasPermission = await Permission.manageExternalStorage.isDenied;
    } else {
      hasPermission = await Permission.storage.request().isGranted;
    }
    return hasPermission;
  }

  Future<bool> isAndroid14OrAbove() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    // Lấy thông tin phiên bản Android
    int androidVersion = androidInfo.version.sdkInt;

    // Kiểm tra xem phiên bản Android có >= 14 không
    return androidVersion >= 14;
  }
}