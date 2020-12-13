tell application "System Events" to tell process "SystemUIServer"
    set wifi to (first menu bar item whose description contains "Wi-Fi") of menu bar 1
    if description of wifi contains "Personal Hotspot"
		return "On"
	else
		return "Off"
	end if
end tell
