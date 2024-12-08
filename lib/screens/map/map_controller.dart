import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tiktok_clone/model/address_model.dart';
import 'package:tiktok_clone/widget/loading/loading.dart';
import 'package:http/http.dart' as http;

import '../../utils/utils.dart';

class MapController extends GetxController {

  final mapCompleter = Completer<GoogleMapController>();

  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  
  final listAddress = <AddressModel>[]; // list of addresses
  final markersCurrent = <Marker>{}.obs; // list of markers on the map
  final DraggableScrollableController draggableScrollableController = DraggableScrollableController();
  final currentExtent = 0.2.obs; // value expand of DraggableScrollableSheet
  final isExpanded = false.obs; // state expand of DraggableScrollableSheet
  final showTabClose = false.obs; // state show of close button of DraggableScrollableSheet
  final routePoints = <LatLng>[].obs; // list of points between the device's location and the destination location
  Position? currentLocation; // current location of the device
  final distance = 0.0.obs; // distance between the device's location and the destination location

  /// Go to the address on the map
  Future<void> goToTheAddress({required AddressModel address, bool myLocation = false}) async {
    final kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(address.latitude, address.longitude),
        tilt: 0,
        zoom: 18);
    final GoogleMapController controller = await mapCompleter.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));

    if (!myLocation) {
      markersCurrent.clear();
      markersCurrent.add(Marker(
        markerId: MarkerId(address.id.toString()),
        position: LatLng(address.latitude, address.longitude),
        infoWindow: InfoWindow(title: address.name),
        icon: BitmapDescriptor.defaultMarker,
      ));
      _getRoute(LatLng(address.latitude, address.longitude));
    }
  }

  /// This function is used to get all the points between the device's location and the destination location,
  /// then we will connect all these coordinates together using the polylines property of GoogleMap.
  /// also marks the destination location on the map.
  ///
  /// Here the current position of the device is determined via the _determinePosition function.
  Future<void> _getRoute(LatLng destination) async {
    if (currentLocation == null) return;

    final start =
    LatLng(currentLocation?.latitude ?? 0, currentLocation?.longitude ?? 0);
    const String orsApiKey =
        '5b3ce3597851110001cf62489a8120adf34f4d8caecfd27e44f4f6a5'; // Replace with your OpenRouteService API key
    final response = await http.get(
      Uri.parse(
          'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$orsApiKey&start=${start.longitude},${start.latitude}&end=${destination.longitude},${destination.latitude}'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> coords =
      data['features'][0]['geometry']['coordinates'];
      routePoints.value =
          coords.map((coord) => LatLng(coord[1], coord[0])).toList();
      distance.value = calculateTotalDistance(
          routePoints: routePoints,
          myLocation: LatLng(
              currentLocation?.latitude ?? 0, currentLocation?.longitude ?? 0),
          destination: destination);
      markersCurrent.add(
          Marker(
            markerId: const MarkerId('1'),
            position: destination,
            infoWindow: const InfoWindow(title: 'Vi tri'),
            icon: BitmapDescriptor.defaultMarker,
          )
      );
    } else {
      // Handle errors
    }
  }

  @override
  void onInit() {
    _initListAddress();
    _initDraggableScrollableSheet();
    gotoMyLocation();
    super.onInit();
  }

  /// Initialize the list of addresses
  void _initListAddress() {
    listAddress.add(AddressModel(id: 1, name: 'Đại Học Bách Khoa Hà Nội', position: '1 Đ. Đại Cồ Việt, Bách Khoa, Hai Bà Trưng, Hà Nội, Việt Nam', latitude: 21.006310551351948, longitude: 105.84340369301133,));
    listAddress.add(AddressModel(id: 2, name: 'Trường Đại Học Kinh Tế Quốc Dân (NEU)', position: '207 Đ. Giải Phóng, Đồng Tâm, Hai Bà Trưng, Hà Nội, Việt Nam', latitude: 21.00010090896274, longitude: 105.84250075673249,));
    listAddress.add(AddressModel(id: 3, name: 'Ngõ 146 Đ. Hoàng Mai', position: 'Ngõ 146 Đ. Hoàng Mai, Hoàng Văn Thụ, Hoàng Mai, Hà Nội, Việt Nam', latitude: 20.992435615055285, longitude: 105.85271303754598,));
    listAddress.add(AddressModel(id: 4, name: 'Chùa Phúc Xuyên', position: '27PG+597, Mỹ Hương, Lương Tài, Bắc Ninh, Việt Nam', latitude: 21.035452336021642, longitude: 106.27593199521736,));
    listAddress.add(AddressModel(id: 5, name: '317 Đ. Trường Chinh', position: '317 Đ. Trường Chinh, Ngã Tư Sở, Thanh Xuân, Hà Nội, Việt Nam', latitude: 21.002214661061593, longitude: 105.82264765288642,));
    listAddress.add(AddressModel(id: 6, name: 'Phố đi bộ Hồ Hoàn Kiếm', position: '2VM2+6QF, P. Gia Ngư, Hàng Đào, Hoàn Kiếm, Hà Nội, Việt Nam', latitude: 21.033093622646497, longitude: 105.85191699521727,));
    listAddress.add(AddressModel(id: 7, name: 'Chùa Phật Tích', position: '295, thôn Phật Tích, Tiên Du, Bắc Ninh 790000, Việt Nam', latitude: 21.09392787975157, longitude: 106.0261428817243,));
    listAddress.add(AddressModel(id: 8, name: 'Vườn Quốc gia Ba Vì', position: 'Ba Vì, Hà Nội, Việt Nam', latitude: 21.08130138826786, longitude: 105.36266630871366,));
    listAddress.add(AddressModel(id: 9, name: 'Bản người Mông Nguyên Thủy', position: 'Mường Sang, Mộc Châu, Sơn La, Việt Nam', latitude: 20.91734630109203, longitude: 104.58984652646613,));
    listAddress.add(AddressModel(id: 10, name: 'Sống Lưng Khủng Long - điểm Săn Mây', position: 'Háng Đồng, Bắc Yên, Sơn La, Việt Nam', latitude: 21.30470122382371, longitude: 104.46408699522557,));
  }

  /// Go to the current location of the device
  Future<void> gotoMyLocation() async {
    await Loading.show();
    determinePosition().then((value) {
      currentLocation = value;
      goToTheAddress(
          address: AddressModel(
              id: 0,
              name: 'Vị trí của tôi',
              position: 'Vị trí của tôi',
              latitude: value.latitude,
              longitude: value.longitude), myLocation: true).then((value) {
        Loading.dismiss();
      });
    }).catchError((error) {
      Loading.dismiss();
    });
  }

  /// Initialize DraggableScrollableSheet
  void _initDraggableScrollableSheet() {
    draggableScrollableController.addListener(() {
      if (draggableScrollableController.size > 0.2) {
        showTabClose.value = true;
      } else {
        showTabClose.value = false;
      }
      if (draggableScrollableController.size == 1) {
        isExpanded.value = true;
      } else if(draggableScrollableController.size == 0.2) {
        isExpanded.value = false;
      }
    });
  }

  /// Collapse DraggableScrollableSheet
  void collapseSheet() {
    draggableScrollableController.animateTo(
      0.2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  /// Expand DraggableScrollableSheet
  void expandSheet() {
    draggableScrollableController.animateTo(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}