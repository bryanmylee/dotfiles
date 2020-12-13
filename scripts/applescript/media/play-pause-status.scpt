on musicPlaying()
  if application "Music" is running then
    tell application "Music"
      if player state is playing then
        return true
      end if
    end tell
  end if
  return false
end musicPlaying

on youtubePlaying()
  if application "Safari" is running then
    tell application "Safari"
      repeat with t in tabs of windows
        tell t
          if URL starts with "https://www.youtube.com/watch" then
            set playing to do Javascript "
              var player = document.querySelector(\"#movie_player\");
              var state = player.getPlayerState();
              var playing = state === 1 || state === 3;
              playing;
            "
            if playing then
              return true
            end if
          end if
        end tell
      end repeat
    end tell
  end if
  return false
end youtubePlaying

if musicPlaying() or youtubePlaying()
  return "Playing"
end if
return "Paused"
