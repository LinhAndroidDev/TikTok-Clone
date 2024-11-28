import 'package:flutter/material.dart';
import 'package:tiktok_clone/gen/colors.dart';

import '../../gen/assets.dart';
import '../../style/text_style.dart';

class BottomSheetShare extends StatelessWidget {
  const BottomSheetShare({super.key, required this.onTapCancel});

  final VoidCallback onTapCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorName.whiteDark,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Share to',
            style: textNormalBold,
          ),
          const SizedBox(
            height: 15,
          ),
          _buildFeatureTop(),
          const SizedBox(
            height: 5,
          ),
          const Divider(color: Color(0xFFDADBDB), thickness: 0.4, height: 0.4),
          const SizedBox(
            height: 15,
          ),
          _buildFeatureBottom(),
          const SizedBox(
            height: 5,
          ),
          _buildFooter()
        ],
      ),
    );
  }

  Widget _buildFeatureTop() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 15,
          ),
          _itemFeatureTop(icon: Assets.images.icWhatsApp, title: 'WhatsApp'),
          const SizedBox(
            width: 15,
          ),
          _itemFeatureTop(icon: Assets.images.icWhatsApp, title: 'WhatsApp'),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 63,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  alignment: Alignment.center,
                  width: 47,
                  height: 47,
                  decoration: const BoxDecoration(
                      color: ColorName.pinkDark, shape: BoxShape.circle),
                  child: Assets.images.icSendWhite.svg(width: 22, height: 22),
                ),
                Text(
                  'Message',
                  style: textSmall.copyWith(color: ColorName.greyDark),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          _itemFeatureTop(icon: Assets.images.icSms, title: 'SMS'),
          const SizedBox(
            width: 15,
          ),
          _itemFeatureTop(
              icon: Assets.images.icMessengerLogo, title: 'Messenger'),
          const SizedBox(
            width: 15,
          ),
          _itemFeatureTop(icon: Assets.images.icInstagram, title: 'Instagram'),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }

  Widget _itemFeatureTop({required SvgGenImage icon, required String title}) {
    return SizedBox(
      width: 63,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon.svg(width: 47, height: 47),
          Text(
            title,
            style: textSmall.copyWith(color: ColorName.greyDark),
          )
        ],
      ),
    );
  }

  Widget _buildFeatureBottom() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 15,
            ),
            _itemFeatureBottom(icon: Assets.images.icReport, title: 'Report'),
            const SizedBox(
              width: 15,
            ),
            _itemFeatureBottom(
                icon: Assets.images.icNotInterested, title: 'Not interested'),
            const SizedBox(
              width: 15,
            ),
            _itemFeatureBottom(
                icon: Assets.images.icSaveVideo, title: 'Save video'),
            const SizedBox(
              width: 15,
            ),
            _itemFeatureBottom(icon: Assets.images.icDuet, title: 'Duet'),
            const SizedBox(
              width: 15,
            ),
            _itemFeatureBottom(icon: Assets.images.icReact, title: 'React'),
            const SizedBox(
              width: 15,
            ),
            _itemFeatureBottom(
                icon: Assets.images.icAddFavourite, title: 'Add to Favorites'),
            const SizedBox(
              width: 15,
            ),
          ],
        ));
  }

  Widget _itemFeatureBottom(
      {required SvgGenImage icon, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: 47,
          height: 47,
          decoration: const BoxDecoration(
              color: ColorName.greyWhite, shape: BoxShape.circle),
          child: icon.svg(width: 22, height: 22),
        ),
        SizedBox(
            width: 63,
            child: Text(
              title,
              style: textSmall.copyWith(color: ColorName.greyDark),
              softWrap: true,
              textAlign: TextAlign.center,
            ))
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      color: ColorName.white,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => onTapCancel.call(),
            child: Text(
              'Cancel',
              style: textNormal,
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
