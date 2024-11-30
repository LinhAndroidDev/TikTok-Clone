import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/model/comment_model.dart';
import 'package:tiktok_clone/model/video_model.dart';
import 'package:video_player/video_player.dart';

import '../../gen/assets.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final pageController = PageController();
  final List<VideoPlayerController> videoControllers = [];
  final videos = <VideoModel>[].obs;
  final currentPage = 0.obs;

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
    videos.add(VideoModel(video: 'https://firebasestorage.googleapis.com/v0/b/realtime-64f58.appspot.com/o/tiktok_video%2Fv14044g50000ct23cpfog65s8j0di4cg.mp4?alt=media&token=7b82f4c1-b297-4633-8f3f-de7ce80bb4df', avatar: 'https://c.stocksy.com/a/Lt2700/z9/1679415.jpg', nameAuthor: 'karennne', description: '', attached: ['avicii', 'wflove'], musicAttached: 'Avicii - Waiting For Love (ft.', likeCount: 4445, commentCount: 64));
    videos.add(VideoModel(video: 'https://firebasestorage.googleapis.com/v0/b/realtime-64f58.appspot.com/o/tiktok_video%2Fv14044g50000ct26b6fog65qed0gk6fg.mp4?alt=media&token=2ad9d59d-fb91-42f4-8808-82d03893071d', avatar: 'https://tse4.mm.bing.net/th?id=OIP.rqP30nn4mA4oDzm0T-wdRwHaHa&pid=Api&P=0&h=220', nameAuthor: 'craig_love', description: 'The most satisfying Job', attached: ['fyp', 'satisfying', 'roadmarking'], musicAttached: 'Roddy Roundicch - The Rou', likeCount: 328720, commentCount: 578, avatarAuthorMusic: Assets.images.icAvatarMusic));
    videos.add(VideoModel(video: 'https://firebasestorage.googleapis.com/v0/b/realtime-64f58.appspot.com/o/tiktok_video%2Fv14044g50000ct2jatfog65kmiqoejvg.mp4?alt=media&token=13c042dd-e9aa-4eb8-a204-c9754da2f876', avatar: 'https://www.pixelstalk.net/wp-content/uploads/2016/08/Download-cute-girl-wallpapers-hd.jpg', nameAuthor: 'Cuộc sống', description: 'Suy tư về cuộc đời', attached: ['fyp', 'satisfying', 'roadmarking'], musicAttached: 'Roddy Roundicch - The Rou', likeCount: 50846, commentCount: 7028, avatarAuthorMusic: Assets.images.icAvatarMusic));
    videos.add(VideoModel(video: 'https://firebasestorage.googleapis.com/v0/b/realtime-64f58.appspot.com/o/tiktok_video%2Fv1c044g50000ct149fnog65h25ai4qo0.mp4?alt=media&token=fa6ae0b7-45ba-4d7b-aa12-7c023290cff9', avatar: 'https://s-media-cache-ak0.pinimg.com/originals/df/58/b9/df58b935991820e742ac06d88bd643a1.jpg', nameAuthor: 'Việt Nam Idol', description: 'Bất ngờ trước kết quả chung cuộc', attached: ['fyp', 'satisfying', 'roadmarking'], musicAttached: 'Roddy Roundicch - The Rou', likeCount: 123499, commentCount: 15738, avatarAuthorMusic: Assets.images.icAvatarMusic));
    videos.add(VideoModel(video: 'https://firebasestorage.googleapis.com/v0/b/realtime-64f58.appspot.com/o/tiktok_video%2Fv1c025g50000cru24vfog65v1r5k3a6g.mp4?alt=media&token=3b7ad298-d707-43ef-be34-4a488466bbe7', avatar: 'https://khoinguonsangtao.vn/wp-content/uploads/2022/10/hinh-vu-tru-nha-phi-hanh-gia.jpg', nameAuthor: 'VTVcab Sports', description: 'Mấy ông tập trung vào bàn giúp tôi nhé!', attached: ['thethaomoingay', 'vtvlive', 'vtvcabsports', 'HaNoiOpen', 'hanoiopenpoolchampionship'], likeCount: 71493, commentCount: 1469));
    videos.add(VideoModel(video: 'https://firebasestorage.googleapis.com/v0/b/realtime-64f58.appspot.com/o/tiktok_video%2Fv14044g50000csso467og65t4uq8h1ag.mp4?alt=media&token=c3cf0d07-29d4-4467-8a81-fbf7d12cc15a', avatar: 'https://img.thuthuat123.com/uploads/2019/07/12/canh-dep-thien-nhien-con-duong-lat-da-di-vao-rung-tham_085323525.jpg', nameAuthor: 'Shop Quân Linh', description: 'Thật hay đùa', attached: ['gaubong', 'gaubongtrend', 'gaubongcute', 'gauom', 'gaubongchobe'], musicAttached: 'Roddy Roundicch - The Rou', likeCount: 35792, commentCount: 451, avatarAuthorMusic: Assets.images.icAvatarMusic));
    videos.add(VideoModel(video: 'https://firebasestorage.googleapis.com/v0/b/realtime-64f58.appspot.com/o/tiktok_video%2Fv1c025g50000ct007u7og65vd8ta11g0.mp4?alt=media&token=0b8f205e-d077-4bcb-b8a7-d4aaadb965d5', avatar: 'https://hinhanhdephd.com/wp-content/uploads/2017/06/hinh-nen-may-tinh-thien-nhien-4.jpg', nameAuthor: 'Báo Lao Động', description: 'Phần 135: Nam thanh niên IT, từng học giỏi và có thu nhập 30-40 triệu đồng/tháng lâm vào tình trạng loạn thần sau 4 năm lạm dụng chất cấm', attached: ['tiktoknews', 'baolaodong', 'loanthan'], musicAttached: 'Roddy Roundicch - The Rou', likeCount: 18366, commentCount: 611, avatarAuthorMusic: Assets.images.icAvatarMusic));
    videos.add(VideoModel(video: 'https://firebasestorage.googleapis.com/v0/b/realtime-64f58.appspot.com/o/tiktok_video%2Fv14044g50000ct08td7og65sc3k03i40.mp4?alt=media&token=1d3c7d72-e460-46e0-93d1-399bbc1f89ae', avatar: 'https://img2.thuthuatphanmem.vn/uploads/2019/02/22/anh-nen-gai-xinh-cho-may-tinh_121749947.jpg', nameAuthor: 'pianissimo', description: 'Một trong những đoạn intro hay nhất nhạc Việt Nam', attached: ['fyp', 'Capcut', 'tiktok', 'piano, trending', 'causeiloveyou'], likeCount: 41493, commentCount: 160));
    videos.add(VideoModel(video: 'https://firebasestorage.googleapis.com/v0/b/realtime-64f58.appspot.com/o/tiktok_video%2Fv14044g50000ct0u4pfog65s1572qefg.mp4?alt=media&token=e4c3d797-bf67-4b4a-be60-b31f2fab1ad8', avatar: 'https://phunugioi.com/wp-content/uploads/2020/04/anh-gai-xinh-hot-girl-nhat-ban-820x513.jpg', nameAuthor: 'Trạm Vũ Trụ', description: 'Nghe lạ lạ mà cũng hay', attached: ['vma', 'nhachaymoingay', 'KhacBietToLon', 'TrinhThangBinh'], likeCount: 31285, commentCount: 287));
    final videoShuffle = videos.toList()..shuffle();
    videos.assignAll(videoShuffle);
    tabController = TabController(length: 2, vsync: this);
    for (var video in videos) {
      video.isLiked = false;
    }
  }

  @override
  void onClose() {
    for(var controller in videoControllers) {
      controller.dispose();
    }
    super.onClose();
  }

  void stopOrPlayVideo() {
    final isPlaying = videoControllers[currentPage.value].value.isPlaying;
    if (isPlaying) {
      videoControllers[currentPage.value].pause();
    } else {
      videoControllers[currentPage.value].play();
    }
  }

  void onTapFavourite(int index) {
    videos[index].isLiked = !videos[index].isLiked;
    videos.refresh();
  }
}