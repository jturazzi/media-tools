# Media Tools

This Docker image provides a set of tools for media conversion and processing, aiming to address storage issues related to images and videos.

## Included Tools

- ffmpeg: A powerful tool for video and audio processing.
- jpegoptim: A utility for JPEG image optimization.
- heif-convert: A tool for converting HEIF images to JPEG.

## Problem Statement

Unoptimized images and videos often occupy significant space on storage. File formats such as HEIC for images and MOV for videos can also pose compatibility issues with certain platforms.

## Script Features

The script included in this Docker image offers the following functionalities:

- **JPEG Compression:** The script utilizes `jpegoptim` to compress JPEG images to reduce their size while preserving their quality.
- **HEIC to JPEG Conversion:** HEIC images are converted to JPEG images using the `heif-convert` tool, making them compatible with a wider variety of platforms and applications.
- **Video Compression or Conversion:** MOV or MP4 format videos are compressed or converted to MP4 format videos using `ffmpeg`. This operation reduces the size of video files while maintaining acceptable quality for viewing and sharing.

## Usage

To use this Docker image, you need to specify an input folder containing the media to be processed and an output folder where the processed media will be stored.

### Docker run
```bash
docker run --rm -v /path/to/media/in:/media/in -v /path/to/media/out:/media/out jturazzi/media-tools:latest
```

### Docker compose
```yml
version: '3.8'
services:
  app:
    image: jturazzi/media-tools:latest
    container_name: media-tools
    volumes:
      - /path/to/media/in:/media/in
      - /path/to/media/out:/media/out
```

## Building the Image

To build the Docker image, you can use the following command:
```bash
docker build -t your_image_name .
```

Make sure to navigate to the directory containing the Dockerfile before executing this command.

## License

This project is licensed under the MIT License.
