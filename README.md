# DASH Video Streaming Project

## Description
End-to-end DASH video streaming implementation using FFmpeg, Nginx, and Linux 
traffic control. Two HD videos are transcoded to multiple bitrates, packaged 
as DASH streams, and served via Nginx to a client VM running a dash.js player.

## Project Structure
- /configs/nginx.conf - Nginx web server configuration with CORS headers
- /configs/traffic-control.sh - Linux tc commands for TBF, HTB and policing
- /player.html - DASH video player HTML page using dash.js
- /screenshots - Evidence screenshots from the project

## Requirements
- Ubuntu 24.04 LTS (two VMs - server and client)
- Oracle VirtualBox
- FFmpeg 6.1.1
- Nginx
- iperf3
- dash.js player

## Installation and Deployment

### Step 1 - Install FFmpeg
```
sudo apt install ffmpeg -y
ffmpeg -version
```

### Step 2 - Download and transcode videos
```
ffmpeg -i video1.mp4 -b:v 1.5M -bufsize 1.5M -preset ultrafast video1_1500k.mp4
ffmpeg -i video1.mp4 -b:v 2.0M -bufsize 2.0M -preset ultrafast video1_2000k.mp4
ffmpeg -i video1.mp4 -b:v 4.0M -bufsize 4.0M -preset ultrafast video1_4000k.mp4
```

### Step 3 - Create DASH manifest
```
ffmpeg -i video1_1500k.mp4 -i video1_2000k.mp4 -i video1_4000k.mp4 \
-map 0:v -map 1:v -map 2:v -c:v copy -f dash \
-seg_duration 4 -use_template 1 -use_timeline 1 manifest.mpd
```

### Step 4 - Install and configure Nginx
```
sudo apt install nginx -y
sudo cp -r dash /var/www/html/
sudo cp player.html /var/www/html/
sudo cp configs/nginx.conf /etc/nginx/sites-available/default
sudo systemctl restart nginx
```

### Step 5 - Apply traffic control (choose one scenario)
See configs/traffic-control.sh for all commands

### Step 6 - Play video on client VM
Open Firefox and navigate to: http://192.168.56.1/player.html
