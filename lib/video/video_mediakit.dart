import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoStreamWidget extends StatefulWidget {
  @override
  _VideoStreamWidgetState createState() => _VideoStreamWidgetState();
}

class _VideoStreamWidgetState extends State<VideoStreamWidget> {
  late final Player _player;
  late final VideoController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the player
    _player = Player();

    // Set up the video controller
    _controller = VideoController(_player);

    // Load the video (local file or stream URL)
    _player.open(
      Media('https://media.w3.org/2010/05/sintel/trailer.mp4'), // Update with your file path or URL
    );
  }

  @override
  void dispose() {
    // _controller.; // Detach the controller instead of disposing it
    _player.dispose(); // Dispose the player
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Stream'),
      ),
      body: Center(
        child: Video(
          controller: _controller,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
