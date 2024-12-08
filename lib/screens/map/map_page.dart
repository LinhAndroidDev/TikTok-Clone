
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tiktok_clone/gen/colors.dart';
import 'package:tiktok_clone/screens/map/map_controller.dart';
import 'package:tiktok_clone/style/text_style.dart';
import 'package:tiktok_clone/utils/utils.dart';
import 'package:tiktok_clone/widget/bottom_sheet/draggale_scrollable_sheet_address.dart';

import '../../widget/divider/divider.dart';

class MapPage extends StatelessWidget {
  MapPage({super.key});

  final controller = Get.find<MapController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
        centerTitle: true,
        titleTextStyle: text16bold,
        surfaceTintColor: ColorName.white,
        backgroundColor: ColorName.white,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: CustomDivider(),
        ),
        elevation: 10,
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: controller.kGooglePlex,
            onMapCreated: (GoogleMapController googleMapController) {
              controller.mapCompleter.complete(googleMapController);
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: Set<Marker>.of(controller.markersCurrent),
            polylines: {
              Polyline(
                polylineId: const PolylineId("route1"),
                points: controller.routePoints,
                color: ColorName.blue,
                width: 5,
                startCap: Cap.roundCap,
                endCap: Cap.buttCap,
              ),
            },
          ),
          DraggaleScrollableSheetAddress(
            listAddress: controller.listAddress,
            onSelected: (address) => controller.goToTheAddress(address: address),
            currentExtent: controller.currentExtent.value,
            isExpanded: controller.isExpanded.value,
            collapseSheet: () => {
              controller.collapseSheet()
            },
            expandSheet: () => {
              controller.expandSheet()
            },
            controller: controller.draggableScrollableController,
            showTabClose: controller.showTabClose.value,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.collapseSheet();
          controller.gotoMyLocation();
        },
        label: Text('Vị trí của tôi \n (${convertDistanceToString(controller.distance.value)})'),
        icon: const Icon(Icons.person_pin_circle_outlined),
      ),
    ));
  }
}
