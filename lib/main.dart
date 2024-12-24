import 'package:flutter/material.dart';
import 'map/map.dart';  
import 'video/video_vlc_example.dart';
import 'video/video_gpt.dart';

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
