-- This is v0.3 of the custom script for AlfredApp for iTerm 2.1.1
-- Please see https://github.com/stuartcryan/custom-iterm-applescripts-for-alfred/
-- for the latest changes.

on is_running(app_name)
	tell application "System Events" to (name of processes) contains app_name
end is_running

-- Please note, if you store the iTerm binary in any other location than the Applications Folder
-- please ensure you update the two locations below (in the format of : rather than / for folder dividers)
-- this gets around issues with AppleScript not handling things well if you have two iTerm binaries on your system... which can happen :D

on alfred_script(q)
	if is_running("iTerm") then
		run script "
			on run {q}
				tell application \":Applications:iTerm.app\"
					activate
					tell the first terminal
						set mysession to (launch session \"Default Session\")
						tell mysession to write text q
					end tell
				end tell
			end run
		" with parameters {q}
	else
		run script "
			on run {q}
				tell application \":Applications:iTerm.app\"
					activate
					tell the first terminal
						tell the last session to write text q
					end tell
				end tell
			end run
		" with parameters {q}
	end if
end alfred_script
