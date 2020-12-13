tell application "Safari"
  repeat with t in tabs of windows
    tell t
      if URL starts with "https://www.youtube.com/watch" then
        return do Javascript "
          var player = document.querySelector(\"#movie_player\");
          function forward() {
              var currentTime = player.getCurrentTime();
              player.seekTo(currentTime + 10, true);
          }
          var state = player.getPlayerState();
          if (state === 1 || state === 3) {
              forward();
          }
          state;
          "
      end if
    end tell
  end repeat
end tell
