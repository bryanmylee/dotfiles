tell application "System Events" to tell process "Macs Fan Control"
  try
    set fanSpeedItem to (first menu bar item of menu bar 2)
    set fanSpeed to title of fanSpeedItem
    return fanSpeed
  on error errMsg
    return "0000rpm / 00°C"
  end try
end tell
