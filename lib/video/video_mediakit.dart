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

  final TextEditingController _uriController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize the player
    _player = Player();

    // Set up the video controller
    _controller = VideoController(_player);
  }

  @override
  void dispose() {
    // _controller.detach();
    _player.dispose();
    _uriController.dispose();
    super.dispose();
  }

  void _playStream() {
    final uri = _uriController.text.trim();
    if (uri.isNotEmpty) {
      _player.open(
        Media(uri),
        play: true,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid URI')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Stream Player'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _uriController,
                    decoration: InputDecoration(
                      labelText: 'Stream URI',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: _playStream,
                    child: Text('Play'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Video(
                controller: _controller,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
