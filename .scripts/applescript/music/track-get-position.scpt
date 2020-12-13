if application "Music" is running then
  tell application "Music"
    return player position / duration of current track
  end tell
end if
return 0
