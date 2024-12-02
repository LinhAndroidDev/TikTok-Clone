import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/gen/colors.dart';
import 'package:tiktok_clone/widget/divider/divider.dart';

import '../../gen/assets.dart';
import '../../style/text_style.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorName.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            _buildHeader(),
            const SizedBox(
              height: 10,
            ),
            const CustomDivider(),
            const SizedBox(
              height: 30,
            ),
            _buildChangeProfile(),
            const SizedBox(
              height: 40,
            ),
            ..._buildContent()
          ],
        ),
      ),
    );
  }

  /// Build change profile
  Widget _buildChangeProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Stack(
              children: [
                Assets.images.avatarProfile.image(width: 90, height: 90),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 90,
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        shape: BoxShape.circle),
                    child: Assets.images.icCamera.svg(width: 20, height: 20),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text('Change photo',
                style: textNormal.copyWith(color: ColorName.black)),
          ],
        ),
        Column(
          children: [
            Container(
              width: 90,
              height: 90,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Color(0xFFF1F1F2), shape: BoxShape.circle),
              child: Assets.images.icVideo.svg(width: 20, height: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Text('Change photo',
                style: textNormal.copyWith(color: ColorName.black)),
          ],
        )
      ],
    );
  }

  /// Build content of profile
  List<Widget> _buildContent() {
    return [
      _buildRowInfo(title: 'Name', action: 'Jacob West'),
      _buildRowInfo(title: 'Username', action: 'jacob_w'),
      _buildRowInfo(title: '', action: 'tiktok.com@jacob_w', isEmail: true),
      _buildRowInfo(title: 'Bio', action: 'Add a bio to your profile'),
      Container(
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
          child: const CustomDivider()),
      _buildRowInfo(
          title: 'Instagram', action: 'Add Instagram to your profile'),
      _buildRowInfo(title: 'YouTube', action: 'Add YouTube to your profile'),
    ];
  }

  /// Build row info
  Widget _buildRowInfo(
      {required String title, required String action, bool isEmail = false}) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Text(title, style: textNormal.copyWith(color: ColorName.black)),
            const Spacer(),
            Text(action, style: textNormal.copyWith(color: ColorName.grey)),
            const SizedBox(width: 5,),
            (!isEmail)
                ? const RotatedBox(
                    quarterTurns: 90,
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: ColorName.grey,
                      size: 12,
                    ),
                  )
                : Assets.images.icCopy.svg(width: 14, height: 14),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

  /// Build header of profile
  Widget _buildHeader() {
    return Stack(
      fit: StackFit.loose,
      children: [
        Positioned(
            left: 15,
            child: InkWell(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: ColorName.black,
                  size: 18,
                ))),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Edit profile',
            style: text16bold,
          ),
        ),
      ],
    );
  }
}
