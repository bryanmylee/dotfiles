if application "Music" is running then
	tell application "Music"
		if shuffle enabled then
			return "Shuffled"
		end if
		return "Not Shuffled"
	end tell
end if
return "Shuffled"
