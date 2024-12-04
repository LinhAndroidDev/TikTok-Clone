import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/gen/colors.dart';
import 'package:tiktok_clone/screens/creative/creative_controller.dart';
import 'package:tiktok_clone/style/text_style.dart';

import '../../gen/assets.dart';
import '../../widget/indicator_tabbar/indicator_tabbar.dart';

class CreativePage extends StatelessWidget {
  CreativePage({super.key});

  final controller = Get.find<CreativeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (!controller.isCameraInitialized.value) {
          return Container(
            color: ColorName.black,
            width: double.infinity,
            height: double.infinity,
          );
        }

        return Container(
          color: ColorName.black,
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  Positioned.fill(
                      top: 60,
                      left: 7,
                      right: 7,
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: CameraPreview(controller.cameraController!))),
                  ..._buildHeader(),
                  Positioned(
                      top: 80,
                      right: 15,
                      child: IntrinsicWidth(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: _buildFeatureCamera(),
                        ),
                      )),
                  Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: _buildFooterCamera())
                ],
              )),
              _buildTabBarFooter(context)
            ],
          ),
        );
      }),
    );
  }

  /// Build header camera
  List<Widget> _buildHeader() {
    return [
      Positioned(
          left: 20,
          top: 80,
          child: InkWell(
              onTap: () => Get.back(),
              child:
                  const Icon(Icons.close, size: 25, color: ColorName.white))),
      Positioned(
        top: 80,
        right: 0,
        left: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.icMusic
                .svg(width: 13, height: 13, color: ColorName.white),
            const SizedBox(width: 5),
            Text('Sounds', style: textNormalSemibold),
          ],
        ),
      ),
    ];
  }

  /// Build feature camera
  List<Widget> _buildFeatureCamera() {
    return [
      _buildItemFeature(icon: Assets.images.icFlip, title: 'Flip'),
      _buildItemFeature(icon: Assets.images.icSpeed, title: 'Speed'),
      _buildItemFeature(icon: Assets.images.icBeauty, title: 'Beauty'),
      _buildItemFeature(icon: Assets.images.icFilters, title: 'Filters'),
      _buildItemFeature(icon: Assets.images.icTimer, title: 'Timer'),
      _buildItemFeature(icon: Assets.images.icFlash, title: 'Flash')
    ];
  }

  /// Build item feature
  Widget _buildItemFeature({required SvgGenImage icon, required String title}) {
    return Column(
      children: [
        icon.svg(width: 24, height: 24),
        const SizedBox(height: 5),
        Text(
          title,
          style: textSmallSemibold,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  /// Build footer camera
  Widget _buildFooterCamera() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.images.icEffects.svg(width: 33, height: 33),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Effects',
              style: textSmallSemibold,
            )
          ],
        ),
        Assets.images.icRecord.svg(width: 80, height: 80),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                onTap: () => controller.pickImageFromGallery(),
                child: Assets.images.icUploadPhoto.svg(width: 33, height: 33)),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Upload',
              style: textSmallSemibold,
            )
          ],
        ),
      ],
    );
  }

  /// Build tab bar footer
  Widget _buildTabBarFooter(BuildContext context) {
    return Container(
      color: ColorName.black,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      child: TabBar(
          tabAlignment: TabAlignment.center,
          indicator: const FixedWidthIndicator(
              color: ColorName.white, width: 0.5, thickness: 5),
          isScrollable: true,
          controller: controller.tabController,
          dividerColor: Colors.transparent,
          labelStyle: textNormalSemibold.copyWith(color: ColorName.white),
          unselectedLabelStyle:
              textNormalSemibold.copyWith(color: ColorName.grey),
          tabs: const [
            Tab(
              text: '60s',
            ),
            Tab(
              text: '15s',
            ),
            Tab(
              text: 'Templates',
            ),
          ]),
    );
  }
}
