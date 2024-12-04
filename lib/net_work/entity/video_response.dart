class VideoResponse {
  final String video;
  final String avatar;
  final String nameAuthor;
  final String description;
  final List<String> attached;
  final String? musicAttached;
  final String? avatarAuthorMusic;
  final int likeCount;
  final int commentCount;

  VideoResponse({
    required this.video,
    required this.avatar,
    required this.nameAuthor,
    required this.description,
    required this.attached,
    this.musicAttached,
    this.avatarAuthorMusic,
    required this.likeCount,
    required this.commentCount,
  });

  factory VideoResponse.fromJson(Map<String, dynamic> json) {
    return VideoResponse(
      video: json['video'],
      avatar: json['avatar'],
      nameAuthor: json['nameAuthor'],
      description: json['description'],
      attached: List<String>.from(json['attached']),
      musicAttached: json['musicAttached'],
      avatarAuthorMusic: json['avatarAuthorMusic'],
      likeCount: json['likeCount'],
      commentCount: json['commentCount'],
    );
  }
}