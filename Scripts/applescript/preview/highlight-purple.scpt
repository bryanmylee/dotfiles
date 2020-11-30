tell application "System Events"
  tell application process "Preview"
    tell group 2 of tool bar 1 of window 1
      click menu button 1 of radio group 1
      click menu item "Purple" of menu 1
    end tell
  end tell
end tell
