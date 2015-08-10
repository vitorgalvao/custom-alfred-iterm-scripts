on is_running(appName)
	tell application "System Events" to (name of processes) contains appName
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
					tell mysession
						write text q
					end tell
				end tell
			end tell
		end run" with parameters {q}
	else
		run script "
			on run {q}
				tell application \":Applications:iTerm.app\"
					activate
					tell the first terminal
						tell the last session
							write text q
						end tell
					end tell
				end tell
			end run" with parameters {q}
	end if
end alfred_script
