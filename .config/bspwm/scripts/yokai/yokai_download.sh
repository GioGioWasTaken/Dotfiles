#!/bin/bash


curl -s https://matthewmeyer.net/artwork/yokai/ | grep -oP '(?<=src=")[^"]*' | grep -E "\.(jpg|jpeg|png|gif)$" > yokai.txt 

# Create a directory to store the images
mkdir -p images

# Read each line in yokai.txt and download the URL with wget
while IFS= read -r url; do
  wget -P images "$url"
done < yokai.txt

rm yokai.txt
