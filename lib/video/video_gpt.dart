import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VideoStreamWidget extends StatefulWidget {
  @override
  _VideoStreamWidgetState createState() => _VideoStreamWidgetState();
}

class _VideoStreamWidgetState extends State<VideoStreamWidget> {
  late VlcPlayerController _videoPlayerController;
  final String _videoUrl = '/home/barel/repos/work/GOPR4724.MP4'; // Update the path as needed
  bool _isError = false;

  @override
  void initState() {
    super.initState();

    // Initialize VLC player with local file
    _videoPlayerController = VlcPlayerController.network(
      _videoUrl,
      hwAcc: HwAcc.full,
      autoPlay: true,
      // options: VlcPlayerOptions(
      //   advanced: {
      //     '--network-caching': '1000', // Optional: Adjust caching for smoother playback
      //   },
      // ),
    );

    // Add a listener to capture errors
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.hasError) {
        setState(() {
          _isError = true;
        });
        print('Video Player Error: ${_videoPlayerController.value.errorDescription}');
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.stopRendererScanning();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Stream'),
      ),
      body: Center(
        child: _isError
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: Colors.red, size: 50),
                  SizedBox(height: 10),
                  Text(
                    'Failed to load video.',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  Text(
                    'Check the file path or format.',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'File: $_videoUrl',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              )
            : VlcPlayer(
                controller: _videoPlayerController,
                aspectRatio: 16 / 9,
                placeholder: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text(
                      'Loading video from:',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      _videoUrl,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
