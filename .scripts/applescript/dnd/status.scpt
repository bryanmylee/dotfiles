tell application "System Events" to tell process "SystemUIServer"
	set notif to (first menu bar item of menu bar 1)
	if title of notif contains "Do Not Disturb"
		return "On"
	else
		return "Off"
	end if
end tell
