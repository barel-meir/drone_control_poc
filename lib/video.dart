import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


// VIDEO STREAM WIDGET

class VideoStreamWidget extends StatefulWidget {
  @override
  _VideoStreamWidgetState createState() => _VideoStreamWidgetState();
}

class _VideoStreamWidgetState extends State<VideoStreamWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Replace with your H.265 video URL
    _controller = VideoPlayerController.networkUrl(
      // Uri.parse('rtsp://127.0.0.1:8554/stream'),
      Uri.parse('/home/barel/repos/work/GOPR4724.MP4'),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Center(child: CircularProgressIndicator());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}