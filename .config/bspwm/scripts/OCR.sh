lang=$(printf "eng\njpn" | rofi -dmenu -p "OCR Language")
flameshot gui --raw | \
  tesseract stdin stdout -l "$lang" | \
  xclip -in -selection clipboard
