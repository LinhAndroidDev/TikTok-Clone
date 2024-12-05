import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {

  final mapCompleter = Completer<GoogleMapController>();
  // Khởi tạo DraggableScrollableController
  final DraggableScrollableController draggableScrollableController = DraggableScrollableController();
  final currentExtent = 0.2.obs;

  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Future<void> goToTheLake() async {
    final GoogleMapController controller = await mapCompleter.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  // Phương thức thu gọn sheet
  void collapseSheet() {
    draggableScrollableController.animateTo(
      0.2, // giá trị minChildSize
      duration: const Duration(milliseconds: 350), // Thời gian hoạt động
      curve: Curves.easeInOut, // Đường cong chuyển động
    );
  }
}