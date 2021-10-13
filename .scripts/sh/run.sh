#!/bin/bash

# My own script for emulating code runner!
FILENAME="$1"
EXT="${FILENAME##*.}"
NAME="${FILENAME%.*}"

if [[ $EXT = "c" ]]; then
  gcc "$FILENAME" -g -O1 -fsanitize=address -o "$NAME";
  ./"$NAME";
  rm "$NAME";
  rm -r "${NAME}.dSYM";
elif [[ $EXT = "py" ]]; then
  python3 "$FILENAME";
elif [[ $EXT = "applescript" ]] || [[ $EXT = "scpt" ]]; then
  osascript "$FILENAME";
elif [[ $EXT = "js" ]]; then
  node "$FILENAME";
elif [[ $EXT = "java" ]]; then
  javac -d temp "$FILENAME" && java -cp .:temp "$NAME" && rm -rf temp;
elif [[ $EXT = "swift" ]]; then
  swift "$FILENAME";
fi
