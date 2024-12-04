
import '../net_work/entity/video_response.dart';

class VideoModel {
  String video;
  String avatar;
  String nameAuthor;
  String description;
  List<String> attached;
  String? musicAttached;
  String? avatarAuthorMusic;
  int likeCount;
  int commentCount;
  bool isLiked;

  VideoModel(
      {required this.video,
      required this.avatar,
      required this.nameAuthor,
      required this.description,
      required this.attached,
      this.musicAttached,
      this.avatarAuthorMusic,
      required this.likeCount,
      required this.commentCount,
      this.isLiked = false
      });

  factory VideoModel.toVideoModel(VideoResponse videoResponse) {
    return VideoModel(
      video: videoResponse.video,
      avatar: videoResponse.avatar,
      nameAuthor: videoResponse.nameAuthor,
      description: videoResponse.description,
      attached: videoResponse.attached,
      musicAttached: videoResponse.musicAttached,
      avatarAuthorMusic: videoResponse.avatarAuthorMusic,
      likeCount: videoResponse.likeCount,
      commentCount: videoResponse.commentCount,
      isLiked: false
    );
  }
}
