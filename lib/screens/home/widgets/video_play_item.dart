import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerItem({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController videoPlayerController;
  var isPlaying = true;
  var finishLoad = false;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        videoPlayerController.play();
        videoPlayerController.setVolume(1);
        videoPlayerController.setLooping(true);
        setState(() {
          finishLoad = true;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if(finishLoad)
        ..._buildViewVideo(context)
        else const SizedBox(),
      ],
    );
  }

  List<Widget> _buildViewVideo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return [
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: size.width,
          height: size.width / videoPlayerController.value.aspectRatio,
          child: VideoPlayer(videoPlayerController),
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            isPlaying = !isPlaying;
            videoPlayerController.value.isPlaying
                ? videoPlayerController.pause()
                : videoPlayerController.play();
          });
        },
        child: Container(
          color: Colors.transparent,
          width: size.width,
          height: size.height,
          child: Center(
            child: (!isPlaying)
                ? const Opacity(
                opacity: 0.3,
                child: Icon(
                  Icons.play_arrow,
                  size: 80,
                  color: Colors.white,
                ))
                : const SizedBox(),
          ),
        ),
      )
    ];
  }
}
