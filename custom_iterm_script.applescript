-- change this property to true to always use a new window
property open_in_new_window : false

-- change this property to true to always start new session on startup
property new_session_on_startup : false

-- set this property to true to always activate and raise the window
property always_activate : true

on alfred_script(q)
	set iterm_started to false
	set num_windows to 0
	tell application "iTerm"
		if application "iTerm" is not running then
			activate
			set iterm_started to true
		end if
		repeat with aWindow in windows
			set num_windows to num_windows + 1
		end repeat
		if open_in_new_window is true or num_windows is equal to 0 then
			create window with default profile
		else
			select current window
			if iterm_started is false then
				tell the current window to create tab with default profile
			else
				if new_session_on_startup is true then
					tell the current window to create tab with default profile
				end if
			end if
		end if
		
		delay 0.1 -- If we do not wait, the command may fail to send
		
		tell the current window to tell current session to write text q
		if always_activate is true then
			activate
		end if
	end tell
end alfred_script
