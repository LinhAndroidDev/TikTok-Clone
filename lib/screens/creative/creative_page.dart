import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/gen/colors.dart';
import 'package:tiktok_clone/screens/creative/creative_controller.dart';
import 'package:tiktok_clone/style/text_style.dart';

import '../../gen/assets.dart';

class CreativePage extends StatelessWidget {
  CreativePage({super.key});

  final controller = Get.find<CreativeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (!controller.isCameraInitialized.value) {
          return Center(
            child: controller.errorMessage.value.isEmpty
                ? Container(
                    color: ColorName.black,
                    width: double.infinity,
                    height: double.infinity,
                  )
                : Text(controller.errorMessage.value),
          );
        }
        return Container(
          color: ColorName.black,
          child: Stack(
            children: [
              Positioned.fill(
                  top: 60,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: CameraPreview(controller.cameraController!))),
              const Positioned(
                  left: 15,
                  top: 100,
                  child: Icon(Icons.close, size: 25, color: ColorName.white)),
              Positioned(
                top: 100,
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
              Positioned(
                  top: 100,
                  right: 15,
                  child: IntrinsicWidth(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: _buildFeatureCamera(),
                    ),
                  )),
              Positioned(
                  bottom: 40, left: 0, right: 0,
                  child: _buildFooterCamera())
            ],
          ),
        );
      }),
    );
  }

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

  Widget _buildFooterCamera() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.images.icEffects.svg(width: 33, height: 33),
            const SizedBox(height: 2,),
            Text('Effects', style: textSmallSemibold,)
          ],
        ),
        Assets.images.icRecord.svg(width: 80, height: 80),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.images.icUploadPhoto.svg(width: 33, height: 33),
            const SizedBox(height: 5,),
            Text('Upload', style: textSmallSemibold,)
          ],
        ),
      ],
    );
  }
}
