on youtube()-- {{{
  tell application "Safari"
    repeat with t in tabs of windows
      tell t
        if URL starts with "https://www.youtube.com/watch" then
          set playing to do Javascript "
            var player = document.querySelector(\"#movie_player\");
            function forward() {
                var currentTime = player.getCurrentTime();
                player.seekTo(currentTime + 10, true);
            }
            var state = player.getPlayerState();
            var playing = state === 1 || state === 3;
            if (playing) {
                forward();
            }
            playing;
          "
          if playing then
            return true
          end if
        end if
      end tell
    end repeat
  end tell
  return false
end youtube-- }}}

on music()-- {{{
  if application "Music" is running then
    tell application "Music"
      if player state is playing then
        set player position to (player position + 10)
        return true
      end if
    end tell
  end if
  return false
end music-- }}}

-- 1.0 or 3.0 indicates a successful shift.
-- If youtube() returns 2.0, then continue the conditional chain
if music() or youtube() then
  return true
end if
return false

