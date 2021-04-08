set status to do shell script "dnd_enabled=$(plutil -extract dnd_prefs xml1 -o - ~/Library/Preferences/com.apple.ncprefs.plist | xpath -q -e 'string(//data)' | base64 -D | plutil -convert xml1 - -o - | xpath -q -e 'boolean(//key[text()=\"userPref\"]/following-sibling::dict/key[text()=\"enabled\"])'); echo $dnd_enabled"

if status equals "1" then
	return "On"
else
	return "Off"
end if

