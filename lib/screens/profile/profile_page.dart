import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/gen/colors.dart';
import 'package:tiktok_clone/routes/app_navigate.dart';
import 'package:tiktok_clone/screens/profile/profile_controller.dart';
import 'package:tiktok_clone/widget/divider/divider.dart';

import '../../gen/assets.dart';
import '../../style/text_style.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Container(
                color: ColorName.white,
                child: Column(
                  children: [
                    const SizedBox(height: 60,),
                    _buildHeader(),
                    _buildContent()
                  ],
                ),
              ),
            )
          ];
        },
        body: _buildTabViewBio(),
      ));
  }

  /// Build header of profile
  Widget _buildHeader() {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: [
        Positioned(
            left: 15,
            child: Assets.images.icAddAccount.svg(width: 22, height: 22)),
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Jacob West',
                style: text16bold,
              ),
              const SizedBox(
                width: 4,
              ),
              Assets.images.icTriangle.svg(width: 7, height: 7)
            ],
          ),
        ),
        Positioned(
            right: 15,
            child: Assets.images.icMenuCircle.svg(width: 18, height: 4))
      ],
    );
  }

  /// Build content of profile
  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15,),
        Assets.images.avatarProfile.image(width: 96, height: 96),
        const SizedBox(height: 10,),
        Text('@jacob_w', style: textNormalSemibold.copyWith(color: ColorName.black),),
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 20,),
            _itemDetailProfile(quantity: 14, title: 'Following'),
            _itemDetailProfile(quantity: 38, title: 'Followers'),
            _itemDetailProfile(quantity: 91, title: 'Likes'),
            const SizedBox(width: 20,),
          ],
        ),
        const SizedBox(height: 15,),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () => AppNavigate.instance.gotoEditProfilePage(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE3E3E4), width: 1),
                  borderRadius: BorderRadius.circular(3)
                ),
                child: Text('Edit Profile', style: textNormalSemibold.copyWith(color: ColorName.black),),
              ),
            ),
            const SizedBox(width: 5,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE3E3E4), width: 1),
                borderRadius: BorderRadius.circular(3)
              ),
              child: Assets.images.icSaveThick.svg(width: 22, height: 22),
            )
          ],
        ),
        const SizedBox(height: 15,),
        Text('Tap to add bio', style: text13White.copyWith(color: ColorName.grey)),
        const SizedBox(height: 15,),
        const CustomDivider(),
        _buildTabBio()
      ],
    );
  }

  /// Item detail profile
  Widget _itemDetailProfile({required int quantity, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(quantity.toString(), style: text18bold),
        const SizedBox(height: 5,),
        Text(title, style: text13White.copyWith(color: ColorName.grey))
      ],
    );
  }

  /// Build tab bio
  Widget _buildTabBio() {
    return Obx(() => TabBar(
        indicatorColor: ColorName.black,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: ColorName.black,
        dividerColor: ColorName.whiteDark,
        controller: controller.tabController,
        tabs: [
          Tab(
            icon: Assets.images.icMenuAll.svg(width: 16, height: 16, color: controller.currentTab.value == 0 ? ColorName.black : const Color(0xFFD7D7D9)),
          ),
          Tab(
            icon: Assets.images.icFavouriteSaved.svg(width: 16, height: 16, color: controller.currentTab.value == 1 ? ColorName.black : const Color(0xFFD7D7D9)),
          ),
        ]));
  }
  
  /// Build tab view bio
  Widget _buildTabViewBio() {
    return TabBarView(
      controller: controller.tabController,
      children: [
        _buildAllTab(videos: controller.videos),
        _buildAllTab(videos: controller.videoFavourites),
      ],
    );
  }

  /// Build all tab
  Widget _buildAllTab({required List<String> videos}) {
    return GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: videos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.3
        ),
        itemBuilder: (context, index) {
          final widthVideo = MediaQuery.of(context).size.width / 3;
          return Container(
            decoration: const BoxDecoration(
              color: ColorName.black,
              border: Border(
                right: BorderSide(color: ColorName.whiteDark, width: 1),
                bottom: BorderSide(color: ColorName.whiteDark, width: 1),
              )
            ),
            alignment: Alignment.center,
            child: Image.network(videos[index], fit: BoxFit.fitWidth, width: widthVideo,),
          );
        }
    );
  }
}
