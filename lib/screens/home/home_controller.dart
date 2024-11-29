import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/model/comment_model.dart';
import 'package:tiktok_clone/model/video_model.dart';

import '../../gen/assets.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final pageController = PageController();
  final likes = <int>[].obs;
  final videos = [].obs;
  
  final comments = [
    CommentModel(avatar: 'https://firebasestorage.googleapis.com/v0/b/realtime-64f58.appspot.com/o/tiktok_image%2FEllipse%205%20(1).png?alt=media&token=125ee31b-1a55-4ecd-8f72-164c0894c1e9', nameCommenter: 'martini_rond', detail: 'How neatly I write the date in my book', time: '22h', likeCount: 8098, repliesCount: 4),
    CommentModel(avatar: 'https://firebasestorage.googleapis.com/v0/b/realtime-64f58.appspot.com/o/tiktok_image%2FEllipse%205%20(2).png?alt=media&token=a6ba3332-78b0-4ffc-a0e1-e112be64ebcb', nameCommenter: 'maxjacobson', detail: 'Now that’s a skill very talented', time: '22h', likeCount: 8098, repliesCount: 1),
    CommentModel(avatar: 'https://firebasestorage.googleapis.com/v0/b/realtime-64f58.appspot.com/o/tiktok_image%2FEllipse%205%20(3).png?alt=media&token=78181603-dc6b-4868-a5e9-8aaa79f403f0', nameCommenter: 'zackjohn', detail: 'Doing this would make me so anxious', time: '22h', likeCount: 8098, repliesCount: 0),
    CommentModel(avatar: 'https://firebasestorage.googleapis.com/v0/b/realtime-64f58.appspot.com/o/tiktok_image%2FEllipse%205%20(4).png?alt=media&token=f954c237-777a-4a86-8919-bce186749013', nameCommenter: 'kiero_d', detail: 'Use that on r air forces to whiten them', time: '21h', likeCount: 8098, repliesCount: 9),
    CommentModel(avatar: 'https://firebasestorage.googleapis.com/v0/b/realtime-64f58.appspot.com/o/tiktok_image%2FEllipse%205%20(5).png?alt=media&token=bb9b4abc-5e7c-4e0a-8741-79556eb22303', nameCommenter: 'mis_potter', detail: 'Sjpuld’ve used that on his forces 😷😷 13h', time: '13h', likeCount: 8098, repliesCount: 4),
    CommentModel(avatar: 'https://firebasestorage.googleapis.com/v0/b/realtime-64f58.appspot.com/o/tiktok_image%2FEllipse%205%20(6).png?alt=media&token=56711020-80d8-4642-9f7e-202e882889e6', nameCommenter: 'karennne', detail: 'No prressure', time: '22h', likeCount: 8098, repliesCount: 2),
    CommentModel(avatar: 'https://firebasestorage.googleapis.com/v0/b/realtime-64f58.appspot.com/o/tiktok_image%2FEllipse%205.png?alt=media&token=a31a23d6-a600-4ea6-a53c-e21a88d872bf', nameCommenter: 'joshua_l', detail: 'My OCD couldn’t do it', time: '15h', likeCount: 8098, repliesCount: 0),
  ];

  @override
  void onInit() {
    super.onInit();
    videos.add(VideoModel(video: Assets.images.video1, avatar: Assets.images.avatar1, nameAuthor: 'karennne', description: '', attached: ['avicii', 'wflove'], musicAttached: 'Avicii - Waiting For Love (ft.', likeCount: 4445, commentCount: 64));
    videos.add(VideoModel(video: Assets.images.video2, avatar: Assets.images.avatar2, nameAuthor: 'craig_love', description: 'The most satisfying Job', attached: ['fyp', 'satisfying', 'roadmarking'], musicAttached: 'Roddy Roundicch - The Rou', likeCount: 328720, commentCount: 578, avatarAuthorMusic: Assets.images.icAvatarMusic));
    tabController = TabController(length: videos.length, vsync: this);
    for (var video in videos) {
      video.isLiked = false;
    }
  }

  void onTapFavourite(int index) {
    videos[index].isLiked = !videos[index].isLiked;
    videos.refresh();
  }
}