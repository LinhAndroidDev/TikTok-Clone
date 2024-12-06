import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/model/address_model.dart';
import 'package:tiktok_clone/widget/divider/divider.dart';

import '../../gen/colors.dart';
import '../../style/text_style.dart';

class DraggableSheetController extends GetxController {
  final DraggableScrollableController draggableScrollableController = DraggableScrollableController();
  final currentExtent = 0.2.obs;

  void collapseSheet() {
    draggableScrollableController.animateTo(
      0.2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

class DraggaleScrollableSheetAddress extends StatelessWidget {
  DraggaleScrollableSheetAddress({super.key, required this.listAddress, required this.onSelected});

  final List<AddressModel> listAddress;
  final controller = Get.put(DraggableSheetController());
  final ValueChanged<AddressModel> onSelected;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        controller: controller.draggableScrollableController,
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
                  delegate: MySliverHeaderDelegate(
                      onTabClose: () => controller.collapseSheet()),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final address = listAddress[index];
                      return InkWell(
                        onTap: () {
                          onSelected.call(address);
                          controller.collapseSheet();
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15,),
                              Text(address.name, style: textNormal,),
                              const SizedBox(height: 2),
                              Text(
                                address.position,
                                style: textSmall.copyWith(color: ColorName.grey),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 15,),
                              const CustomDivider(),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: listAddress.length,
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class MySliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 50.0; // Chiều cao tối thiểu khi cuộn
  @override
  double get maxExtent => 50.0; // Chiều cao tối đa khi không cuộn

  final VoidCallback onTabClose;

  MySliverHeaderDelegate({required this.onTabClose});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
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
        ),
        Positioned(right: 15, child: InkWell(
            onTap: () => onTabClose.call(),
            child: const Icon(Icons.close, size: 25, color: ColorName.black,))),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
