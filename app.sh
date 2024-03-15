#!/bin/bash

# Directory to monitor
source_dir="/media/in"
output_dir="/media/out"

# Function for JPEG compression
compress_jpeg() {
  local file="$1"
  local filename=$(basename "$file")
  local output_file="${output_dir}/${filename}"

  echo "Compressing $filename..."
  jpegoptim --max=80 "$file" -d "$output_dir"
  if [ -e "${output_file}" ]; then
    rm "$file"
    echo "Compression of $filename completed."
  else
    echo "Unable to compress $filename."
    mv "$file" "${output_dir}/${filename}"
  fi
}

# Function for MP4 compression
convert_or_compress_mp4() {
  local file="$1"
  local filename=$(basename "$file")
  local output_file="${output_dir}/${filename}.mp4"

  echo "Compressing $filename..."
  ffmpeg -i "$file" -c:v libx264 -crf 30 -preset medium -c:a aac -b:a 192k -map_metadata 0 "$output_file" && rm "$file"
  echo "Compression of $filename completed."
}

# Function for HEIC to JPEG conversion
convert_heic_to_jpeg() {
  local file="$1"
  local filename=$(basename "$file")
  local filename_no_ext="${filename%.*}"
  local output_file="${output_dir}/${filename%.*}.jpg"

  echo "Converting $filename..."

  heif-convert "$file" "$output_file" && rm "$file"

  rm -f "${output_dir}/${filename_no_ext}-"*".jpg"

  sleep 1

  mv "${output_dir}/${filename%.*}.jpg" "${source_dir}/${filename%.*}.jpg"

  echo "Conversion of $filename completed."
}

# Function for folder monitoring
watch_folder() {
  echo "Waiting for files..."
  while true; do
    for file in "$source_dir"/*; do
      [[ -f "$file" ]] || continue

      case "$file" in
        *.heic | *.HEIC) convert_heic_to_jpeg "$file" ;;
        *.jpg | *.JPG | *.jpeg | *.JPEG) compress_jpeg "$file" ;;
        *.mp4 | *.MP4 | *.mov | *.MOV) convert_or_compress_mp4 "$file" ;;
      esac
    done

    # Waiting for 5 seconds before checking for new files again
    sleep 5
  done
}

# Execute folder monitoring
watch_folder
