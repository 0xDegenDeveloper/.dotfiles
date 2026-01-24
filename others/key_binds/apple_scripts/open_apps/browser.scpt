tell application "Brave Browser"
    if it is running then
        activate
    else
        launch
        delay 0.5
        activate
    end if
end tell
