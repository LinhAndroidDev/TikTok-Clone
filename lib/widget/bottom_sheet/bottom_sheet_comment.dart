import 'package:flutter/material.dart';
import 'package:tiktok_clone/gen/colors.dart';
import 'package:tiktok_clone/model/comment_model.dart';
import 'package:tiktok_clone/style/text_style.dart';

import '../../screens/home/widgets/item_comment_view.dart';

class BottomSheetComment extends StatelessWidget {
  const BottomSheetComment({super.key, required this.comments});

  final List<CommentModel> comments;

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
        const Positioned(
            right: 15,
            child: Icon(
              Icons.close,
              color: ColorName.black,
              size: 15,
            ))
      ],
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
