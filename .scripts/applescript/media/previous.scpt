on youtube()-- {{{
  tell application "Safari"
    repeat with t in tabs of windows
      tell t
        if URL starts with "https://www.youtube.com/watch" then
          set playing to do Javascript "
            var player = document.querySelector(\"#movie_player\");
            var state = player.getPlayerState();
            var playing = state === 1 || state === 3;
            if (playing) {
              // player.previousVideo() only works in playlists.
              window.history.back();
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
end youtube-- }}}

on music()-- {{{
  if application "Music" is running then
    tell application "Music"
      if player state is playing then
        previous track
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
