# Drone Control PoC

A proof-of-concept Flutter application for drone control.

## Project Overview
This project is a poc for flutter application using map and video


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

