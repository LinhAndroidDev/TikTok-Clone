import 'package:flutter/material.dart';
import 'package:tiktok_clone/gen/colors.dart';
import 'package:tiktok_clone/model/comment_model.dart';
import 'package:tiktok_clone/style/text_style.dart';

import '../../gen/assets.dart';
import '../../screens/home/widgets/item_comment_view.dart';

class BottomSheetComment extends StatelessWidget {
  const BottomSheetComment({super.key, required this.comments, required this.closeBottomComment});

  final List<CommentModel> comments;
  final VoidCallback closeBottomComment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10,),
          _buildHeader(),
          const SizedBox(height: 20,),
          Expanded(child: _buildListComment()),
          _buildFooter()
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
        fit: StackFit.loose,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            '579 comments',
            style: text13Semibold.copyWith(color: ColorName.black),
          ),
        ),
        Positioned(
            right: 15,
            child: InkWell(
              onTap: () => closeBottomComment.call(),
              child: const Icon(
                Icons.close,
                color: ColorName.black,
                size: 15,
              ),
            ))
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      decoration: const BoxDecoration(
        color: ColorName.white,
        border: Border(
          top: BorderSide(
            color: ColorName.greyLight,
            width: 0.1,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.none,
              cursorColor: ColorName.black,
              cursorErrorColor: ColorName.black,
              cursorWidth: 0.7,
              style: textNormal,
              decoration: InputDecoration(
                hintText: 'Add comment...',
                hintStyle: textNormal.copyWith(color: ColorName.greyLight),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
          ),
          Assets.images.icTag.svg(width: 22, height: 22),
          const SizedBox(width: 20,),
          Assets.images.icEmotion.svg(width: 22, height: 22),
          const SizedBox(width: 15,),
        ],
      ),
    );
  }

  Widget _buildListComment() {
    return ListView.builder(
      itemCount: comments.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ItemCommentView(commentModel: comments[index]),
              const SizedBox(height: 15,)
            ],
          );
    });
  }
}
