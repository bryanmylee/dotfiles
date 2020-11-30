tell application "System Events" to tell process "SystemUIServer"
    set wifi to (first menu bar item whose description contains "Wi-Fi") of menu bar 1
    if description of wifi contains "Personal Hotspot" 
        click wifi
        click (first menu item whose title contains "Disconnect from") of menu 1 of wifi
    else
        if description of wifi contains "Wi-Fi is not enabled."
            click wifi
            click (first menu item whose title is "Turn Wi-Fi On") of menu 1 of wifi
        end if
        click wifi
        delay 1
        click (first menu item whose title contains "Bryan’s iPhone Xʀ") of menu 1 of wifi
    end if
end tell
