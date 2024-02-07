#!/bin/sh
keyboard_layout=$(hyprctl getoption input:kb_variant | sed -n '4p' | awk '{print $2}')
if [[ $keyboard_layout == "\"[[EMPTY]]\"" ]]; then
  new_layout="neo"
else
  new_layout="[[EMPTY]]"
fi
hyprctl keyword input:kb_variant $new_layout
  
