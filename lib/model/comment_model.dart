import 'package:tiktok_clone/gen/assets.dart';

class CommentModel {
  final String avatar;
  final String nameCommenter;
  final String detail;
  final String time;
  final int likeCount;
  final int repliesCount;

  CommentModel({
    required this.avatar,
    required this.nameCommenter,
    required this.detail,
    required this.time,
    required this.likeCount,
    required this.repliesCount,
  });
}