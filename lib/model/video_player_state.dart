import 'package:get/get.dart';

class VideoPlayerState {
  RxBool isPlay = false.obs;
  Future<void>? initializeVideoPlayerFuture;
}