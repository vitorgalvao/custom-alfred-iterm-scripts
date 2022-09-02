-- For the latest version:
-- https://github.com/vitorgalvao/custom-alfred-iterm-scripts

-- Set this property to true to always open in a new window
property open_in_new_window : false

-- Set this property to false to reuse current tab
property open_in_new_tab : true

-- Set this property to true if iTerm is configured to launch without opening a new window
property iterm_opens_quietly : true

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

  tell application "iTerm"
    if windows is {} then return false
    if tabs of current window is {} then return false
    if sessions of current tab of current window is {} then return false

    set session_text to contents of current session of current tab of current window
    if words of session_text is {} then return false
  end tell

  true
end has_windows

on send_text(custom_text)
  tell application "iTerm" to tell the first window to tell current session to write text custom_text
end send_text

-- Main
on alfred_script(query)
  if has_windows() then
    if open_in_new_window then
      new_window()
    else if open_in_new_tab then
      new_tab()
    else
      -- Reuse current tab
    end if
  else
    -- If iTerm is not running and we tell it to create a new window, we get two
    -- One from opening the application, and the other from the command
    if is_running() or iterm_opens_quietly then
      new_window()
    else
      call_forward()
    end if
  end if

  -- Make sure a window exists before we continue, or the write may fail
  set loopCount to 0 as integer
  repeat until (loopCount > 100) -- wait up to 10 seconds
    if has_windows() then
      send_text(query)
      call_forward()
      exit repeat
    end if
    delay 0.10
    set loopCount to loopCount + 1
  end repeat
end alfred_script
