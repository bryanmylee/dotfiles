-- WARNING:
-- BetterTouchTool cannot load external scripts asynchronously.
-- Doing so will cause multiple errors.
-- Instead, copy the script into the script window.

on musicPlaying()-- {{{
  if application "Music" is running then
    tell application "Music"
      return player state is playing
    end tell
  end if
  return false
end musicPlaying-- }}}

on setMusicPosition(sliderValue)-- {{{
  tell application "Music"
    set player position to sliderValue * (duration of current track)
  end tell
end getMusicPosition-- }}}

on setYoutubePosIfPlaying(sliderValue)-- {{{
  tell application "Safari"
    repeat with t in tabs of windows
      tell t
        if URL starts with "https://www.youtube.com/watch" then
          do Javascript "
            var player = document.querySelector(\"#movie_player\");
            var state = player.getPlayerState();
            var shouldAct = state === 1 || state === 3;

            var duration = player.getDuration();
            if (shouldAct) {
              player.seekTo(" & sliderValue & " * duration);
            }
          "
        end if
      end tell
    end repeat
  end tell
end setYoutubePosIfPlaying-- }}}

on bttWidgetSliderMoved(sliderValue)
  if musicPlaying() then
    setMusicPosition(sliderValue)
  else 
    setYoutubePosIfPlaying(sliderValue)
  end if
end bttWidgetSliderMoved

