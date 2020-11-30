tell application "System Events"
    tell appearance preferences
        if dark mode then
            return "On"
        end if
        return "Off"
    end tell
end tell
