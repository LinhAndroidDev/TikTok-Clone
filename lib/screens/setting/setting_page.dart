import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/widget/divider/divider.dart';

import '../../gen/assets.dart';
import '../../gen/colors.dart';
import '../../style/text_style.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 60,),
            _buildHeader(),
            const SizedBox(height: 10,),
            const CustomDivider(),
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: _buildContent(),
              ),
            ))
          ],
        ),
      ),
    );
  }

  /// Build content of setting
  List<Widget> _buildContent() {
    return [
      const SizedBox(height: 15,),
      ..._buildFeatureAccount(),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: const CustomDivider(),
      ),
      ..._buildFeatureGeneral(),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: const CustomDivider(),
      ),
      ..._buildFeatureSupport(),
      const SizedBox(height: 40,),
    ];
  }

  /// Build feature account
  List<Widget> _buildFeatureAccount() {
    return [
      Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 15, bottom: 15),
          child: Text('ACCOUNT', style: textNormal.copyWith(color: ColorName.grey, fontWeight: FontWeight.w500),)),
      _buildRowSetting(icon: Assets.images.icAccountUnCheck, title: 'Manage my account'),
      const SizedBox(height: 30,),
      _buildRowSetting(icon: Assets.images.icLock, title: 'Privacy and safety'),
      const SizedBox(height: 30,),
      _buildRowSetting(icon: Assets.images.icVideo, title: 'Content preferences'),
      const SizedBox(height: 30,),
      _buildRowSetting(icon: Assets.images.icBalance, title: 'Balance'),
      const SizedBox(height: 30,),
      _buildRowSetting(icon: Assets.images.icShareStroke, title: 'Share profile'),
      const SizedBox(height: 30,),
      _buildRowSetting(icon: Assets.images.icQrCode, title: 'TikCode'),
      const SizedBox(height: 30,),
    ];
  }

  /// Build feature general
  List<Widget> _buildFeatureGeneral() {
    return [
      const SizedBox(height: 30,),
      Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 15, bottom: 15),
          child: Text('GENERAL', style: textNormal.copyWith(color: ColorName.grey, fontWeight: FontWeight.w500),)),
      _buildRowSetting(icon: Assets.images.icNotification, title: 'Push notifications'),
      const SizedBox(height: 30,),
      _buildRowSetting(icon: Assets.images.icLanguage, title: 'Language'),
      const SizedBox(height: 30,),
      _buildRowSetting(icon: Assets.images.icDigital, title: 'Digital Wellbeing'),
      const SizedBox(height: 30,),
      _buildRowSetting(icon: Assets.images.icAccessibility, title: 'Accessibility'),
      const SizedBox(height: 30,),
      _buildRowSetting(icon: Assets.images.icDataSaver, title: 'Data Saver'),
      const SizedBox(height: 30,),
    ];
  }

  /// Build feature support
  List<Widget> _buildFeatureSupport() {
    return [
      const SizedBox(height: 30,),
      Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 15, bottom: 15),
          child: Text('SUPPORT', style: textNormal.copyWith(color: ColorName.grey, fontWeight: FontWeight.w500),)),
      _buildRowSetting(icon: Assets.images.icProblem, title: 'Report a problem'),
      const SizedBox(height: 30,),
      _buildRowSetting(icon: Assets.images.icQuestion, title: 'Help Center'),
      const SizedBox(height: 30,),
    ];
  }

  /// Build row setting
  Widget _buildRowSetting({required SvgGenImage icon, required String title}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 15,),
        icon.svg(width: 16, height: 16, color: ColorName.grey),
        const SizedBox(width: 15,),
        Text(title, style: textNormal.copyWith(color: ColorName.black),),
        const Spacer(),
        const RotatedBox(quarterTurns: 90, child: Icon(Icons.arrow_back_ios_new_sharp, size: 12, color: ColorName.grey,),),
        const SizedBox(width: 15,),
      ],
    );
  }

  /// Build header of setting
  Widget _buildHeader() {
    return Stack(
      fit: StackFit.loose,
      children: [
        Positioned(
            left: 15,
            child: InkWell(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios_new_sharp, color: ColorName.black, size: 18,))),
        Align(
          alignment: Alignment.center,
          child: Text('Privacy and settings', style: text16bold,),
        ),
      ],
    );
  }
}
