tell application "System Events" to tell process "Macs Fan Control"
  set fs to (first menu bar item of menu bar 2)
  click fs
  -- For some reason, this is VERY slow
  click menu item "Preset - Automatic" of menu 1 of menu bar item 1 of menu bar 2
end tell

