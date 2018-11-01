-- This is v0.7 of the custom script for AlfredApp for iTerm 3.1.1+
-- created by WangJia hmfight@qq.com
-- github: https://github.com/hmfight

on alfred_script(q)
	if application "iTerm2" is running or application "iTerm" is running then
		run script "
			on run {q}
				tell application \":Applications:iTerm.app\"
					activate
					try
						select first window
						set newCreateWindow to false
					on error
						create window with default profile
						select first window
						set newCreateWindow to true
					end try
					tell current window
						if newCreateWindow is false then
							create tab with default profile
						end if
						tell current session to write text q
					end tell	
				end tell
			end run
		" with parameters {q}
	else
		run script "
			on run {q}
				tell application \":Applications:iTerm.app\"
					activate
					try
						select first window
					on error
						create window with default profile
						select first window
					end try
					tell the first window
						tell current session to write text q
					end tell
				end tell
			end run
		" with parameters {q}
	end if

end alfred_script