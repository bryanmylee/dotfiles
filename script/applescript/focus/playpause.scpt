tell application "System Events" to tell process "Focus"
    -- Open the menu bar item
    click first menu bar item of menu bar 2
    -- Press the play/pause button
    click UI Element 3 of group 1 of window 1
    -- Close the menu bar item
    click first menu bar item of menu bar 2
end tell
