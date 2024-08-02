flameshot gui --raw | 
  tesseract stdin stdout | 
  xclip -in -selection clipboard
