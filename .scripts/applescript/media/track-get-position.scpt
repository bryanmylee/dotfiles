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

on getMusicPosition()-- {{{
  tell application "Music"
    return player position / duration of current track
  end tell
end getMusicPosition-- }}}

on getYoutubePosIfPlaying()-- {{{
  tell application "Safari"
    repeat with t in tabs of windows
      tell t
        if URL starts with "https://www.youtube.com/watch" then
          set position to do Javascript "
            var player = document.querySelector(\"#movie_player\");
            var state = player.getPlayerState();
            var playing = state === 1 || state === 3;

            var duration = player.getDuration();
            var position = 0;

            if (playing && duration !== 0) {
              position = player.getCurrentTime() / duration;
            }
            position;
          "
          if position > 0 then
            return position
          end if
        end if
      end tell
    end repeat
  end tell
  return false
end getYoutubePosIfPlaying-- }}}

if musicPlaying() then
  return getMusicPosition()
else
  return getYoutubePosIfPlaying()
end if
return 0.0
