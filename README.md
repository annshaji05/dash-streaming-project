# DASH Video Streaming Project 

##Overview 
End-to-end DASH video streaming setup using ffmpeg, Nginx and Linux traffic control.

##Structure
- /dash -DASH manifest and video segments
- /screenshots - Evidence screenshots
- /configs -Nginx and traffic control configs

## Installation 
1. Install ffmpeg: sudo apt install ffmpeg
2. Install Nginx: sudo apt install nginx
3. Copy dash folder to /var/www/html/
4. Apply traffic control rules as per configs folder 

##Requirements
- Ubuntu 24.04
- VirtualBox with two VMs (Server + Client)
- ffmpeg, Nginx, iperf3

