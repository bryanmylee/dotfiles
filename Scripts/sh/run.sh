#!/bin/bash

# My own script for emulating code runner!
filename="$1"
ext="${filename##*.}"
name="${filename%.*}"

if [[ $ext = "c" ]]; then
  clang "$filename" -g -O1 -fsanitize=address -o "$name";
  ./"$name";
  rm "$name";
  rm -r "${name}.dSYM"
elif [[ $ext = "py" ]]; then
  python3 "$filename"
elif [[ $ext = "applescript" ]] || [[ $ext = "scpt" ]]; then
  osascript "$filename"
elif [[ $ext = "js" ]]; then
  node "$filename"
elif [[ $ext = "java" ]]; then
  javac "$filename" && java "$name";
fi
