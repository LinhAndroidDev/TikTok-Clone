import 'package:tiktok_clone/gen/assets.dart';

class VideoModel {
  final AssetGenImage video;
  final AssetGenImage avatar;
  final String nameAuthor;
  final String description;
  final List<String> attached;
  final String musicAttached;
  final AssetGenImage? avatarAuthorMusic;
  final int likeCount;
  final int commentCount;

  VideoModel(
      {required this.video,
      required this.avatar,
      required this.nameAuthor,
      required this.description,
      required this.attached,
      required this.musicAttached,
      this.avatarAuthorMusic,
      required this.likeCount,
      required this.commentCount});
}
