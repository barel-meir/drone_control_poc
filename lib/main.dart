import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(DroneControlPOC());
}

class DroneControlPOC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            // Video stream on the left
            Expanded(
              flex: 1,
              child: VideoStreamWidget(),
            ),
            // Map on the right
            Expanded(
              flex: 1,
              child: MapWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

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
    _controller = VideoPlayerController.network(
      'http://your-drone-stream-url/stream.mkv',
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
class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(51.5, -0.09), // Update to the correct parameter
        initialZoom: 13, // Update to match the latest API
      ),
      children: [
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
      ],
    );
  }
}
