on alfred_script(q)
  tell application "iTerm-adhoc"
	repeat with newWindow in (every window where is hotkey window is true)
		tell newWindow
			reveal hotkey window
		end tell
		tell current session of newWindow
			write text q
		end tell
        delay 1
		tell newWindow
			hide hotkey window
		end tell
		exit repeat
	end repeat
 end tell
end alfred_script
