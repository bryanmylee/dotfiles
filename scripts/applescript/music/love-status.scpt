if application "Music" is running then
  tell application "Music"
    try
      if loved of current track then
        return "Loved"
      end if
      return "Unloved"
    on error errMsg
      return "Unloved"
    end try
  end tell
end if
return "Unloved"
