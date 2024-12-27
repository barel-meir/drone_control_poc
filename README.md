# Drone Control PoC

A proof-of-concept Flutter application for drone control.

## Project Overview
This project serves as a starting point for building a Flutter application focused on drone control, featuring:
- A map display (using Leaflet) on the right side.
- A video stream display (H.265 format) on the left side.

## Screenshot
Below is a screenshot of the application interface:

![Application Screenshot](![alt text](image.png))

## Getting Started
If this is your first Flutter project, here are a few resources to help you get started:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For comprehensive Flutter development documentation, visit the [Flutter Documentation](https://docs.flutter.dev/), which includes tutorials, samples, mobile development guidance, and a full API reference.

## Sample Videos
You can use the following sample video files or streams for testing:

### Local Files:
- `/home/barel/repos/drone_control_poc/videos/GOPR4692.MP4`
- `/home/barel/repos/drone_control_poc/videos/vid_265.mp4`

### Online Sample:
- [Sintel Trailer](https://media.w3.org/2010/05/sintel/trailer.mp4)

### RTSP Stream:
- `rtsp://127.0.0.1:8554/stream`

## go2rtc Configuration
To manage video streams, you can use the `go2rtc` Docker image.

### Docker Image:
```bash
docker pull alexxit/go2rtc
```

### Basic Deployment:
```bash
docker run -d \
  --name go2rtc \
  --network host \
  --privileged \
  --restart unless-stopped \
  -e TZ=Atlantic/Bermuda \
  -v ~/go2rtc:/config \
  alexxit/go2rtc
```

### Configuration File:
Example configuration to include streams:
```yaml
streams:
  web:
    - ffmpeg:device?video=/dev/video0&input_format=mjpeg&video_size=1280x720
  s4:
    - file:///home/barel/repos/drone_control_poc/videos/GOPR4692.MP4
```

## Notes
- Ensure you have Docker installed and properly configured on your system.
- Modify the configuration file as needed to suit your setup.

