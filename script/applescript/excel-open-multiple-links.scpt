tell Application "Microsoft Excel"
  tell active sheet
    set theList to get value of range("B402:B501") as list
    repeat with theItem in theList
      tell application "Safari" to open location theItem
    end repeat
  end tell
end tell
