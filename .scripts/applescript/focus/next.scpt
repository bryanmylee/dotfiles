tell application "System Events" to tell process "Focus"
    -- Open the menu bar item
    click first menu bar item of menu bar 2
    -- Press the next button
    click UI Element 4 of group 1 of window 1
    -- Close the menu bar item
    click first menu bar item of menu bar 2
end tell
