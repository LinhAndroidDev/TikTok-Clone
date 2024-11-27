import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/gen/colors.dart';
import 'package:tiktok_clone/screens/home/home_controller.dart';
import 'package:tiktok_clone/screens/home/widgets/item_page_video.dart';
import 'package:tiktok_clone/style/text_style.dart';
import 'package:tiktok_clone/widget/bottom_sheet/bottom_sheet_comment.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final pageController = PageController();
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _buildPageVideo(),
        Positioned(top: 50, left: 0, right: 0, child: _buildTabHeader()),
      ],
    ));
  }

  Widget _buildTabHeader() {
    return TabBar(
        tabAlignment: TabAlignment.center,
        indicatorColor: ColorName.white,
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true,
        controller: controller.tabController,
        dividerColor: Colors.transparent,
        labelStyle: text16Semibold,
        unselectedLabelStyle:
            text18Semibold.copyWith(color: ColorName.white.withOpacity(0.6)),
        tabs: const [
          Tab(
            text: 'Following',
          ),
          Tab(
            text: 'For You',
          ),
        ]);
  }

  Widget _buildPageVideo() {
    return PageView.builder(
        controller: pageController,
        scrollDirection: Axis.vertical,
        itemCount: controller.videos.length,
        itemBuilder: (context, index) {
          return ItemPageVideo(
            videoModel: controller.videos[index],
            onTapFavourite: () {

            },
            onTapComment: () {
              Get.bottomSheet(
                  BottomSheetComment(
                    comments: controller.comments,
                  ),
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
              );
            },
          );
        }
    );
  }
}
