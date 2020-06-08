-- Set this property to true to always open in a new window
property open_in_new_window : false

-- Handlers
on new_window()
	tell application "iTerm" to create window with default profile
end new_window

on new_tab()
	tell application "iTerm" to tell the first window to create tab with default profile
end new_tab

on call_forward()
	tell application "iTerm" to activate
end call_forward

on is_running()
	application "iTerm" is running
end is_running

on has_windows()
	if not is_running() then return false
	if windows of application "iTerm" is {} then return false
	true
end has_windows

on send_text(custom_text)
	-- iTerm may try to write text before a window exists, so wait for it
	repeat until has_windows()
		delay 0.1
	end repeat
	
	tell application "iTerm" to tell the first window to tell current session to write text custom_text
end send_text

-- Main
on alfred_script(query)
	if has_windows() then
		if open_in_new_window then
			new_window()
		else
			new_tab()
		end if
	else
		if is_running() then
			new_window()
		else
			call_forward()
		end if
	end if
	
	send_text(query)
	call_forward()
end alfred_script