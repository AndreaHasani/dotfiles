if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
export LC_ALL="en_US.UTF-8"
export TESSDATA_PREFIX=/home/strixx/.tesseract/lang_data/tessdata/
export TERM=rxvt-unicode-256color
