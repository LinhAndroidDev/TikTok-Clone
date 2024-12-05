
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tiktok_clone/gen/colors.dart';
import 'package:tiktok_clone/screens/map/map_controller.dart';
import 'package:tiktok_clone/style/text_style.dart';

import '../../widget/divider/divider.dart';

class MapPage extends StatelessWidget {
  MapPage({super.key});

  final controller = Get.find<MapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            mapType: MapType.normal,
            initialCameraPosition: controller.kGooglePlex,
            onMapCreated: (GoogleMapController googleMapController) {
              controller.mapCompleter.complete(googleMapController);
            },
          ),
          DraggableScrollableSheet(
              initialChildSize: controller.currentExtent.value,
              minChildSize: 0.2,
              maxChildSize: 1,
              builder: (context, scrollController) {
                return Container(
                  color: ColorName.white,
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      // SliverPersistentHeader
                      SliverPersistentHeader(
                        delegate: MySliverHeaderDelegate(),
                        pinned: true,
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return ListTile(title: Text("Vị trí thứ: $index", style: textNormal,));
                          },
                          childCount: 20,
                        ),
                      ),
                    ],
                  ),
                );
              })
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }
}

// Tạo một delegate cho SliverPersistentHeader
class MySliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 50.0; // Chiều cao tối thiểu khi cuộn
  @override
  double get maxExtent => 50.0; // Chiều cao tối đa khi không cuộn

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
        color: ColorName.white,
        border: Border(
          bottom: BorderSide(
            color: ColorName.greyWhite,
            width: 0.5,
          ),
        ),
      ),
      child: Text(
        "Danh sách địa điểm",
        style: text16bold,
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false; // Không cần phải xây dựng lại khi có sự thay đổi
  }
}
