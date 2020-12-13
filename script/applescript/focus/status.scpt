tell application "System Events" to tell process "Focus"
  try
    set timerItem to (first menu bar item of menu bar 2)
    set timeStr to title of timerItem
    return timeStr
  on error errMsg
    return "00:00"
  end try
    -- set json to "{\"text\":\"" & timeStr & "\",\"font_color\":\"255,255,255,255\"}"
    -- return json
end tell
