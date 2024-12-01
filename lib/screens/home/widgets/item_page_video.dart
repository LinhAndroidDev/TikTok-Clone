import 'package:flutter/material.dart';
import 'package:tiktok_clone/gen/colors.dart';
import 'package:tiktok_clone/model/video_model.dart';
import 'package:tiktok_clone/style/text_style.dart';
import 'package:tiktok_clone/utils/utils.dart';
import 'package:tiktok_clone/widget/circle_animation.dart';

import '../../../gen/assets.dart';
import 'video_play_item.dart';

class ItemPageVideo extends StatelessWidget {
  const ItemPageVideo(
      {super.key,
      required this.videoModel,
      required this.onTapFavourite,
      required this.onTapComment,
      required this.onTapShare,
      });

  final VideoModel videoModel;
  final VoidCallback onTapFavourite ;
  final VoidCallback onTapComment;
  final VoidCallback onTapShare;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorName.black,
      child: Stack(
        children: [
          VideoPlayerItem(videoUrl: videoModel.video),
          Positioned(
            bottom: 0,
              right: 5,
              child: IntrinsicWidth(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: _buildFeature(),
            ),
          )),
          Positioned(
            bottom: 15,
              left: 15,
              child: _buildDescriptionVideo(context))
        ],
      ),
    );
  }

  /// Build description of video
  Widget _buildDescriptionVideo(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('@${videoModel.nameAuthor}', style: text16Semibold,),
          const SizedBox(height: 5,),
          Wrap(
            spacing: 5,
            children: [
            Text(videoModel.description, style: text13White,),
            ...videoModel.attached.map((attach) => Text(
                    '#$attach',
                    style: textNormalSemibold,
                  ))
            ],),
          const SizedBox(height: 3,),
          (videoModel.musicAttached != null)
              ? _buildMusicAttached()
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _buildMusicAttached() {
    return Row(
      children: [
        Assets.images.icMusic.svg(width: 15, height: 15),
        const SizedBox(
          width: 5,
        ),
        Text(
          videoModel.musicAttached ?? '',
          style: textNormal.copyWith(color: ColorName.white),
        ),
      ],
    );
  }

  /// Build feature of video
  Widget _buildFeature() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 47,
          height: 47,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(videoModel.avatar, width: 47, height: 47, fit: BoxFit.cover,)),
        ),
        Column(
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () => onTapFavourite.call(),
                    child: Assets.images.icFavourite.svg(width: 35, height: 35, color: (videoModel.isLiked) ? ColorName.pinkRed : ColorName.white)),
                Text(convertNumberToString(videoModel.likeCount), style: text13Semibold,)
              ],
            ),
            const SizedBox(height: 20,),
            Column(
              children: [
                InkWell(
                  onTap: () => onTapComment.call(),
                    child: Assets.images.icMessage.svg(width: 35, height: 35)),
                Text(convertNumberToString(videoModel.commentCount), style: text13Semibold,)
              ],
            ),
            const SizedBox(height: 20,),
            Column(
              children: [
                InkWell(
                  onTap: () => onTapShare.call(),
                    child: Assets.images.icShare.svg(width: 35, height: 35)),
                Text('Share', style: text13Semibold,)
              ],
            ),
          ],
        ),
        CircleAnimation(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Assets.images.icDisc.svg(width: 49, height: 49),
              if (videoModel.avatarAuthorMusic != null)
                videoModel.avatarAuthorMusic!
                    .image(width: 30, height: 30, fit: BoxFit.fill)
            ],
          ),
        )
      ],
    );
  }
}
