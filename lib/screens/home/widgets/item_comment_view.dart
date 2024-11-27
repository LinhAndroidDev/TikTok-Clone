import 'package:flutter/material.dart';
import 'package:tiktok_clone/gen/colors.dart';
import 'package:tiktok_clone/model/comment_model.dart';
import 'package:tiktok_clone/style/text_style.dart';

import '../../../gen/assets.dart';

class ItemCommentView extends StatelessWidget {
  const ItemCommentView({super.key, required this.commentModel});

  final CommentModel commentModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 15),
        ClipOval(
          child: Image.network(commentModel.avatar, width: 32, height: 32,),
        ),
        const SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(commentModel.nameCommenter, style: text13Semibold.copyWith(color: ColorName.grey),),
            const SizedBox(height: 3,),
            Text(commentModel.detail, style: textNormal,),
            const SizedBox(height: 7,),
            Row(
              children: [
                Text('View replies (${commentModel.repliesCount})', style: text13Semibold.copyWith(color: ColorName.grey),),
                const RotatedBox(quarterTurns: 135, child: Icon(Icons.arrow_back_ios_sharp, size: 12, color: ColorName.grey,),)
              ],
            )
          ],
        ),
        const Spacer(),
        IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.images.icFavouriteStroke.svg(width: 15, height: 15),
              const SizedBox(height: 2,),
              Text(commentModel.likeCount.toString(), style: text13White.copyWith(color: ColorName.grey),),
            ],
          ),
        ),
        const SizedBox(width: 10,)
      ],
    );
  }
}
