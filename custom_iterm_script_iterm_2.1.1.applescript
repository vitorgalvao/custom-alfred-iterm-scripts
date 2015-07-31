on is_running(appName)
	tell application "System Events" to (name of processes) contains appName
end is_running

on alfred_script(q)
	if is_running("iTerm") then
		run script "
			on run {q}

			tell application \"iTerm\"
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
				tell application \"iTerm\"
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