-- WARNING:
-- BetterTouchTool cannot load external scripts asynchronously.
-- Doing so will cause multiple errors.
-- Instead, copy the script into the script window.

on bttWidgetSliderMoved(sliderValue)
  if application "Music" is running then
    tell application "Music"
      set player position to sliderValue * (duration of current track)
    end tell
  end if
end bttWidgetSliderMoved
