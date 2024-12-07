import 'package:flutter/material.dart';
import 'package:tiktok_clone/model/address_model.dart';
import 'package:tiktok_clone/widget/divider/divider.dart';

import '../../gen/colors.dart';
import '../../style/text_style.dart';

class DraggaleScrollableSheetAddress extends StatelessWidget {
  const DraggaleScrollableSheetAddress({
    super.key,
    required this.listAddress,
    required this.onSelected,
    required this.currentExtent,
    required this.isExpanded,
    required this.collapseSheet,
    required this.expandSheet,
    required this.controller,
    required this.showTabClose});

  final List<AddressModel> listAddress;
  final Function(AddressModel) onSelected;
  final double currentExtent;
  final bool isExpanded;
  final VoidCallback collapseSheet;
  final VoidCallback expandSheet;
  final bool showTabClose;

  final DraggableScrollableController controller;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        controller: controller,
        initialChildSize: currentExtent,
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
                      onTabClose: () => collapseSheet.call(),
                      isExpanded: isExpanded,
                      expand: () => expandSheet.call(),
                      showTabClose: showTabClose),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final address = listAddress[index];
                      return InkWell(
                        onTap: () {
                          onSelected.call(address);
                          collapseSheet.call();
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
  final VoidCallback expand;
  final bool isExpanded;
  final bool showTabClose;

  MySliverHeaderDelegate(
      {required this.onTabClose,
      required this.expand,
      required this.isExpanded,
      required this.showTabClose});

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
        Positioned(
            left: 15,
            child: InkWell(
              onTap: () {
                (isExpanded) ? onTabClose.call() : expand.call();
              },
              child: RotatedBox(
                  quarterTurns: (isExpanded) ? 135 : 45,
                  child: const Icon(Icons.arrow_back_ios_new_sharp, size: 20, color: ColorName.grey,)),
            )),
        Positioned(right: 15, child: InkWell(
            onTap: () => onTabClose.call(),
            child: Visibility(
              visible: showTabClose,
                child: const Icon(Icons.close, size: 25, color: ColorName.black,)))),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
