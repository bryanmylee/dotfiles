tell application "Safari"
    repeat with t in tabs of windows
        tell t
            if URL starts with "https://www.youtube.com/watch" then
                do Javascript "
                var player = document.querySelector(\"#movie_player\");
                function rewind() {
                    var currentTime = player.getCurrentTime();
                    if (currentTime > 10) {
                        player.seekTo(currentTime - 10, true);
                    } else {
                        player.seekTo(0, true);
                    }
                }
                var state = player.getPlayerState();
                if (state === 1 || state === 3) {
                    rewind();
                }
                "
            end if
        end tell
    end repeat
end tell
