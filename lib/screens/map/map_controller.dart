import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tiktok_clone/model/address_model.dart';
import 'package:tiktok_clone/widget/loading/loading.dart';

class MapController extends GetxController {

  final mapCompleter = Completer<GoogleMapController>();

  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  
  final listAddress = <AddressModel>[];
  final markersCurrent = <Marker>{}.obs;

  Future<void> goToTheAddress({required AddressModel address}) async {
    final kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(address.latitude, address.longitude),
        tilt: 0,
        zoom: 18);
    final GoogleMapController controller = await mapCompleter.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));

    markersCurrent.clear();
    markersCurrent.add(Marker(
      markerId: MarkerId(address.id.toString()),
      position: LatLng(address.latitude, address.longitude),
      infoWindow: InfoWindow(title: address.name),
      icon: BitmapDescriptor.defaultMarker,
    ));
  }

  @override
  void onInit() {
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
    gotoMyLocation();
    super.onInit();
  }

  Future<void> gotoMyLocation() async {
    await Loading.show();
    _determinePosition().then((value) {
      goToTheAddress(
          address: AddressModel(
              id: 0,
              name: 'Vị trí của tôi',
              position: 'Vị trí của tôi',
              latitude: value.latitude,
              longitude: value.longitude)).then((value) {
        Loading.dismiss();
      });
    }).catchError((error) {
      print('Error: $error');
    });
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}