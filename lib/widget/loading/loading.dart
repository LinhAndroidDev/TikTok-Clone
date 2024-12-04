import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tiktok_clone/gen/colors.dart';

class Loading {
  static Future<void> show({bool isTransparent = false}) async {
    if (isTransparent) {
      EasyLoading.instance.maskColor = Colors.transparent;
      await EasyLoading.show(
        maskType: EasyLoadingMaskType.custom,
        indicator: const SizedBox.shrink(),
      );
    } else {
      await EasyLoading.show();
    }
  }

  static Future<void> dismiss() async {
    await EasyLoading.dismiss();
  }

  static bool get isShow => EasyLoading.isShow;

  static void configLoading() async {
    EasyLoading.instance
      ..contentPadding = const EdgeInsets.all(30)
      ..radius = 15
      ..indicatorSize = 50
      ..maskType = EasyLoadingMaskType.none
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = ColorName.white
      ..textColor = Colors.black
      ..indicatorColor = ColorName.black
      ..animationStyle = EasyLoadingAnimationStyle.scale;
  }
}
