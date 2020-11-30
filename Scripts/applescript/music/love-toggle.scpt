tell application "Music"
  if loved of current track is true then
		set loved of current track to false
	else
		set loved of current track to true
	end if
end tell
