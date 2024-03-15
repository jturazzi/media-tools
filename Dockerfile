FROM ubuntu:latest
LABEL maintainer="Jérémy TURAZZI <jeremy@trz.fr>"
LABEL description="Media conversion and processing tools image and video."

# Create input and output directories for media
RUN mkdir -p /media/in /media/out

# Install necessary tools
RUN apt-get update && apt-get install -y \
    ffmpeg \
    jpegoptim \
    libheif-examples

# Copy monitoring and conversion script into the image
COPY app.sh /usr/local/bin/

# Default command to execute when the container starts
CMD ["app.sh"]
