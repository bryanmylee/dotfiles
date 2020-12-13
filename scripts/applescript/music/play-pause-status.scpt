if application "Music" is running then
	tell application "Music"
		if player state is playing then
			return "Playing"
		end if
		return "Paused"
	end tell
end if
return "Playing"
